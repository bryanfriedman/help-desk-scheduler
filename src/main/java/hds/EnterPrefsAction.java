package hds;

import java.sql.*;
import java.util.*;
import javax.servlet.http.*;
import org.apache.struts.action.*;

public final class EnterPrefsAction extends Action {

  public ActionForward perform(ActionMapping mapping,
      ActionForm form,
      HttpServletRequest request,
      HttpServletResponse response) {

   javax.sql.DataSource dataSource;
   java.sql.Connection myConnection = null;
   Vector schedules = new Vector(); 
   ScheduleForm schedule = null;

   try {
      dataSource = servlet.findDataSource(null);
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

	request.setAttribute("schedules", schedules);

   // Forward control to the specified success target
   return (mapping.findForward("success"));

  }
}