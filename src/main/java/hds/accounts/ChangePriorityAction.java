package hds.accounts;

import java.sql.*;
import java.util.*;
import javax.servlet.http.*;
import org.apache.struts.action.*;

public final class ChangePriorityAction extends Action {

  public ActionForward perform(ActionMapping mapping,
      ActionForm form,
      HttpServletRequest request,
      HttpServletResponse response) {

      if (!(request.isUserInRole("A"))) {
         return (mapping.findForward("privileges"));
      }

      javax.sql.DataSource dataSource;
      java.sql.Connection myConnection = null;
      HttpSession session = request.getSession();
      PrioritiesForm f = (PrioritiesForm) form;

      // Was this transaction cancelled?
      if (isCancelled(request)) {
          if (mapping.getAttribute() != null)
              session.removeAttribute(mapping.getAttribute());
          return (mapping.findForward("success"));
      }

      ActionErrors errors = new ActionErrors();
      // Report any errors we have discovered back to the original form
      if (!errors.empty()) {
         saveErrors(request, errors);
         saveToken(request);
         return (new ActionForward(mapping.getInput()));
      }     

      try {

         dataSource = servlet.findDataSource(null);
         myConnection = dataSource.getConnection();

         Statement stmt = myConnection.createStatement();

         // Get max priority
         String sql = "SELECT MAX(priority) AS priority FROM users";
         ResultSet rs = stmt.executeQuery(sql);
         rs.next();
         int max = rs.getInt("priority");
         
          sql = "SELECT priority ";
         sql += "FROM users ";
         sql += "WHERE username = ";
         sql += "'" + f.getUsername() + "'";

         rs = stmt.executeQuery(sql);
         rs.next();
         
         // Calculate new priority
         int oldPriority = rs.getInt("priority");
         int amt = Integer.parseInt(f.getAmount());
         int newPriority = 0;
         int change = 0;
         int changeTo = 0;
         if ("up".equals(f.getDirection())) {
            newPriority = oldPriority - amt;
            if (newPriority < 1) {
               newPriority = 1;
            }
            change = oldPriority - 1;
            changeTo = change + 1;
         } else {
            newPriority = oldPriority + amt;
            if (newPriority > max) {
               newPriority = max;
            }
            change = oldPriority + 1;
            changeTo = change - 1;
         }

         // Temporarily set priority to NULL to move everyone else
          sql = "UPDATE users SET ";
         sql += "priority = NULL ";
         sql += "WHERE username = ";
         sql += "'" + f.getUsername() + "'";

         stmt.executeUpdate(sql);

         // Move everyone else
         if ("up".equals(f.getDirection())) {
            while (change >= newPriority) {
                sql = "UPDATE users SET ";
               sql += "priority = " + Integer.toString(changeTo);
               sql += " WHERE priority = " + Integer.toString(change);

               stmt.executeUpdate(sql);

               change--;
               changeTo--;
            }
         } else {
            while (change <= newPriority) {
                sql = "UPDATE users SET ";
               sql += "priority = " + Integer.toString(changeTo);
               sql += " WHERE priority = " + Integer.toString(change);

               stmt.executeUpdate(sql);

               change++;
               changeTo++;
            }
         }

         // Change user to correct priority (fill in the new hole)
          sql = "UPDATE users SET ";
         sql += "priority = " + Integer.toString(newPriority);
         sql += " WHERE username = ";
         sql += "'" + f.getUsername() + "'";

         stmt.executeUpdate(sql);

      } catch (SQLException sqle) {
         request.setAttribute("exception", sqle.getMessage());
         return (mapping.findForward("failure"));
      } finally {
         //enclose this in a finally block to make
         //sure the connection is closed
         try {
            myConnection.close();
         } catch (SQLException e) {
            request.setAttribute("exception", e.getMessage());
            return (mapping.findForward("failure"));
         }
      }


      // Forward control to the specified success target
      return (mapping.findForward("success"));

  }
}