package hds.accounts;

import java.sql.*;
import java.util.*;
import javax.servlet.http.*;
import org.apache.struts.action.*;

public final class EditAccountAction extends Action {

  public ActionForward perform(ActionMapping mapping,
      ActionForm form,
      HttpServletRequest request,
      HttpServletResponse response) {

   javax.sql.DataSource dataSource;
   java.sql.Connection myConnection = null;
   HttpSession session = request.getSession();
   String action = request.getParameter("action");
   String user = request.getParameter("username");

   // Populate the form
	if (form == null) {
	   form = new AccountsForm();
      if ("request".equals(mapping.getScope()))
         request.setAttribute(mapping.getAttribute(), form);
      else
         session.setAttribute(mapping.getAttribute(), form);
	}

   AccountsForm f = (AccountsForm) form;

   // Was this transaction cancelled?
	if (isCancelled(request)) {
	    if (mapping.getAttribute() != null)
	        session.removeAttribute(mapping.getAttribute());
	    return (mapping.findForward("success"));
	}

   try {
      dataSource = servlet.findDataSource(null);
      myConnection = dataSource.getConnection();
   
      if ("modify".equals(f.getAction())) {

         String sql = "SELECT u.username, fullname, email, ";
               sql += "       active, role ";
               sql += "FROM users u, roles r ";
               sql += "WHERE u.username = r.username ";
               sql += "AND u.username = '" + user + "'";

         Statement stmt = myConnection.createStatement();
         ResultSet rs = stmt.executeQuery(sql);
         rs.next();

         if ("T".equals(rs.getString("active"))) {
            f.setActive(true);
         } else {
            f.setActive(false);
         }
         f.setUsername(rs.getString("username"));
         f.setFullname(rs.getString("fullname"));
         f.setEmail(rs.getString("email"));
         f.setType(rs.getString("role"));
         f.setPassword("");

      } else if ("create".equals(f.getAction())) {

         f.setUsername("");
         f.setFullname("");
         f.setEmail("");
         
      }
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

   f.setAction(action);
   
   // Forward control to the specified success target
   return (mapping.findForward("success"));

  }
}