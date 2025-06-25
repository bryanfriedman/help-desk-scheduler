package hds.accounts;

import java.sql.*;
import java.util.*;
import javax.servlet.http.*;
import org.apache.struts.action.*;

public final class PrioritiesAction extends Action {

  public ActionForward perform(ActionMapping mapping,
      ActionForm form,
      HttpServletRequest request,
      HttpServletResponse response) {
   
   if (!(request.isUserInRole("A"))) {
      return (mapping.findForward("privileges"));
   }

   javax.sql.DataSource dataSource;
   java.sql.Connection myConnection = null;
   Vector accounts = new Vector(); 
   AccountsForm user = null;

   try {
      dataSource = servlet.findDataSource(null);
      myConnection = dataSource.getConnection();

      String sql = "SELECT u.username, fullname, priority, role ";
            sql += "FROM users u, roles r WHERE ";
            sql += "u.username = r.username AND role != 'A' ";
            sql += "ORDER BY priority ASC";

      Statement stmt = myConnection.createStatement();
      ResultSet rs = stmt.executeQuery(sql);

      while (rs.next()) {
         user = new AccountsForm();
         user.setUsername(rs.getString("username"));
         user.setFullname(rs.getString("fullname"));
         user.setPriority(rs.getInt("priority"));
         accounts.add(user);
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

	request.setAttribute("accounts", accounts);

   // Forward control to the specified success target
   return (mapping.findForward("success"));

  }
}