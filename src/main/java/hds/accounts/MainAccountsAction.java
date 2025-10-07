package hds.accounts;

import java.sql.*;
import java.util.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import jakarta.servlet.http.*;
import org.apache.struts.action.*;

public final class MainAccountsAction extends Action {

  public ActionForward execute(ActionMapping mapping,
      ActionForm form,
      HttpServletRequest request,
      HttpServletResponse response) throws Exception {
   
   String role = null;
   if (request.isUserInRole("A")) {
      role = "A";
   } else if (request.isUserInRole("L")) {
      role = "L";
   } else if (request.isUserInRole("S")) {
      role = "S";
   } else {
      role = null;
   }

   if (role == null) {
      request.setAttribute("exception", "Role is null.");
      return (mapping.findForward("failure"));
   }

   DataSource dataSource;
   java.sql.Connection myConnection = null;
   Vector accounts = new Vector();

   String sort = request.getParameter("sort");
   String order = "role, u.username ASC";

   AccountsForm user = null;

   if ("t".equals(sort)) {
      order = "role, u.username ASC";
   } else if ("p".equals(sort)) {
      order = "priority ASC";
   } else if ("a".equals(sort)) {
      order = "u.username ASC";
   }

   try {
      dataSource = (DataSource) ((Context) new InitialContext().lookup("java:comp/env")).lookup("jdbc/hds");
      myConnection = dataSource.getConnection();

      String sql = "SELECT u.username, fullname, email, role, active, ";
            sql += "       DATE_FORMAT(created, '%m/%d/%Y %h:%i %p') as created, priority, ";
            sql += "       DATE_FORMAT(start_date, '%m/%d/%Y') as start_date ";
            sql += "FROM users u, roles r WHERE u.username = r.username ";
            if (!("A".equals(role))) {
               sql += "AND r.role != 'A' ";
            }
            sql += "ORDER BY " + order;

      Statement stmt = myConnection.createStatement();
      ResultSet rs = stmt.executeQuery(sql);

      while (rs.next()) {
         user = new AccountsForm();
         user.setUsername(rs.getString("username"));
         user.setFullname(rs.getString("fullname"));
         user.setEmail(rs.getString("email"));
         user.setType(rs.getString("role"));
         user.setCreateDate(rs.getString("created"));
         user.setPriority(rs.getInt("priority"));
         user.setStartDate(rs.getString("start_date"));
         if ("T".equals(rs.getString("active"))) {
            user.setActive(true);
         } else {
            user.setActive(false);
         }
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