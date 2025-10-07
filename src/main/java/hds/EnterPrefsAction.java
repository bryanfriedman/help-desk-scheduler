package hds;

import java.sql.*;
import java.util.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import jakarta.servlet.http.*;
import org.apache.struts.action.*;

public final class EnterPrefsAction extends Action {

  public ActionForward execute(ActionMapping mapping,
      ActionForm form,
      HttpServletRequest request,
      HttpServletResponse response) throws Exception {

   DataSource dataSource;
   java.sql.Connection myConnection = null;
   Vector schedules = new Vector(); 
   ScheduleForm schedule = null;

   try {
      dataSource = (DataSource) ((Context) new InitialContext().lookup("java:comp/env")).lookup("jdbc/hds");
      myConnection = dataSource.getConnection();

      String sql = "SELECT schedule_id, schedule_name, start_date ";
            sql += "FROM schedules WHERE start_date > now() ";
            sql += "ORDER BY start_date ASC";

      Statement stmt = myConnection.createStatement();
      ResultSet rs = stmt.executeQuery(sql);

      if (rs.next()) {
         schedule = new ScheduleForm();
         schedule.setId(Integer.toString(rs.getInt("schedule_id")));
         schedule.setName(rs.getString("schedule_name"));
         schedules.add(schedule);
      } else {
         return (mapping.findForward("noScheds"));
      }

      while (rs.next()) {
         schedule = new ScheduleForm();
         schedule.setId(Integer.toString(rs.getInt("schedule_id")));
         schedule.setName(rs.getString("schedule_name"));
         schedules.add(schedule);
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

	request.setAttribute("schedules", schedules);

   // Forward control to the specified success target
   return (mapping.findForward("success"));

  }
}