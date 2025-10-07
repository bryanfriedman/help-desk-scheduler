package hds.accounts;

import java.sql.*;
import java.util.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import jakarta.servlet.http.*;
import org.apache.struts.action.*;

public final class PrioritiesAction extends Action {

  public ActionForward execute(ActionMapping mapping,
      ActionForm form,
      HttpServletRequest request,
      HttpServletResponse response) throws Exception {
   
   if (!(request.isUserInRole("A"))) {
      return (mapping.findForward("privileges"));
   }

   DataSource dataSource;
   java.sql.Connection myConnection = null;
   Vector accounts = new Vector(); 
   AccountsForm user = null;

   try {
      dataSource = (DataSource) ((Context) new InitialContext().lookup("java:comp/env")).lookup("jdbc/hds");
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
   } catch (Exception sqle) {
      request.setAttribute("exception", sqle.getMessage());
      return (mapping.findForward("failure"));
   } finally {
      //enclose this in a finally block to make
      //sure the connection is closed
      try {
         myConnection.close();
      } catch (Exception e) {
         request.setAttribute("exception", e.getMessage());
         return (mapping.findForward("failure"));
      }
   }

	request.setAttribute("accounts", accounts);

   // Forward control to the specified success target
   return (mapping.findForward("success"));

  }
}