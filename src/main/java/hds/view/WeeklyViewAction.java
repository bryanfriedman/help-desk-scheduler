package hds.view;

import java.sql.*;
import java.util.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import jakarta.servlet.http.*;
import org.apache.struts.action.*;
import hds.HDSDate;

public final class WeeklyViewAction extends Action {

  public ActionForward execute(ActionMapping mapping,
      ActionForm form,
      HttpServletRequest request,
      HttpServletResponse response) throws Exception {
   
   HttpSession session = request.getSession();
   DataSource dataSource;
   java.sql.Connection myConnection = null;
   ViewScheduleForm f = (ViewScheduleForm) form;

   Vector master = new Vector();
   for (int i = 0; i < 5; i++)
      master.add(new Vector());
   
   ScheduleViewForm entry = null;

   String weekNumber = null;
   HDSDate week = new HDSDate(f.getWeekOfDate());
   HDSDate sd = null;

   try {
         dataSource = (DataSource) ((Context) new InitialContext().lookup("java:comp/env")).lookup("jdbc/hds");
         myConnection = dataSource.getConnection();
         Statement stmt = myConnection.createStatement();
         String sql = "SELECT DATE_FORMAT(start_date, '%m/%d/%Y') AS start_date ";
               sql += "FROM schedules WHERE ";
               sql += "schedule_id = " + f.getScheduleId();

         ResultSet rs = stmt.executeQuery(sql);
         rs.next();
         sd = new HDSDate(rs.getString("start_date"));

         long diff_ms = Math.abs(sd.toDate().getTime()-week.toDate().getTime());
         long diff_days = diff_ms / (24*60*60*1000);

         long week_no = (diff_days / 7) + 1;
         weekNumber = Integer.toString((int) week_no);

          sql = "SELECT * FROM master m, users u ";
         sql += "WHERE u.username = m.username ";
         if ("individual".equals(f.getType()))
            sql += "AND m.username = '" + f.getUsername() + "' ";
         sql += "AND m.schedule_id = " + f.getScheduleId() + " ";
         sql += "AND m.week_num = " + weekNumber;

         rs = stmt.executeQuery(sql);

         String start = null;
         String end = null;
         String full = null;
         int s = 0;
         int e = 0;

         while (rs.next()) {
            entry = new ScheduleViewForm();
            entry.setDayOfWeek(rs.getString("day_of_week"));
            entry.setWeekNumber(rs.getInt("week_num"));
            entry.setScheduleId(rs.getInt("schedule_id"));
            
            full = rs.getString("fullname");
            entry.setName(full.substring(0, full.indexOf(" ")+2) + ".");
            
            start = rs.getString("start_time");
            end = rs.getString("end_time");
            entry.setStartTime(start);
            entry.setEndTime(end);

            s = Integer.parseInt(start.substring(0,2));
            e = Integer.parseInt(end.substring(0,2));
            entry.setShiftLength(Integer.toString(e-s));
   
            if (s > 12)
               s = s-12;
            if (e > 12)
               e = e-12;

            entry.setStart(Integer.toString(s));
            entry.setEnd(Integer.toString(e));

            if ("M".equals(entry.getDayOfWeek())) {
               Vector mondays = (Vector) master.getFirst();
               mondays.add(entry);
            } else if ("T".equals(entry.getDayOfWeek())) {
               Vector tuesdays = (Vector) master.get(1);
               tuesdays.add(entry);
            } else if ("W".equals(entry.getDayOfWeek())) {
               Vector wednesdays = (Vector) master.get(2);
               wednesdays.add(entry);
            } else if ("R".equals(entry.getDayOfWeek())) {
               Vector thursdays = (Vector) master.get(3);
               thursdays.add(entry);
            } else if ("F".equals(entry.getDayOfWeek())) {
               Vector fridays = (Vector) master.get(4);
               fridays.add(entry);
            }

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

   Vector times = new Vector();
   times.add("08:00:00"); times.add("09:00:00");
   times.add("10:00:00"); times.add("11:00:00");
   times.add("12:00:00"); times.add("13:00:00");
   times.add("14:00:00"); times.add("15:00:00");
   times.add("16:00:00"); times.add("17:00:00");
   times.add("18:00:00");

   session.setAttribute("times", times);
	session.setAttribute("master", master);

   return (mapping.findForward("success"));  

  }
}