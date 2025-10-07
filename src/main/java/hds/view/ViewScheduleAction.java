package hds.view;

import java.sql.*;
import java.util.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import jakarta.servlet.http.*;
import org.apache.struts.action.*;
import hds.*;
import hds.accounts.*;

public final class ViewScheduleAction extends Action {

  public ActionForward execute(ActionMapping mapping,
      ActionForm form,
      HttpServletRequest request,
      HttpServletResponse response) throws Exception {
   
   HttpSession session = request.getSession();
   session.removeAttribute("viewScheduleForm");

   DataSource dataSource;
   java.sql.Connection myConnection = null;
   Vector schedules = new Vector();
   Vector weekNums = new Vector();
   Vector users = new Vector();
   ScheduleForm schedule = null;
   AccountsForm user = null;
   ViewScheduleForm f = (ViewScheduleForm) form;

   try {
      dataSource = (DataSource) ((Context) new InitialContext().lookup("java:comp/env")).lookup("jdbc/hds");
      myConnection = dataSource.getConnection();

      String sql = "SELECT schedule_name, schedule_id ";
            sql += "FROM schedules WHERE ";
            sql += "start_date <= now() ";
            sql += "ORDER BY start_date DESC";

      Statement stmt = myConnection.createStatement();
      ResultSet rs = stmt.executeQuery(sql);
      
      while (rs.next()) {
         schedule = new ScheduleForm();
         schedule.setName(rs.getString("schedule_name"));
         schedule.setId(rs.getString("schedule_id"));
         schedules.add(schedule);
      }

       sql = "SELECT u.username, fullname ";
      sql += "FROM users u, roles r WHERE ";
      sql += "u.username = r.username AND ";
      sql += "r.role IN ('S', 'L') ";
      sql += "ORDER BY fullname ASC";

      stmt = myConnection.createStatement();
      rs = stmt.executeQuery(sql);

      while (rs.next()) {
         user = new AccountsForm();
         user.setUsername(rs.getString("username"));
         user.setFullname(rs.getString("fullname"));
         users.add(user);
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

	request.setAttribute("users", users);
	request.setAttribute("schedules", schedules);

   // Forward control to the specified success target
   return (mapping.findForward("success"));

  }
}