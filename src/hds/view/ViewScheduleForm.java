package hds.view;

import javax.servlet.http.*;
import java.lang.*;
import org.apache.struts.action.*;
import java.sql.*;
import hds.HDSDate;

public final class ViewScheduleForm extends ActionForm {

   /* Schedule ID */
   private String scheduleId = null;
   public String getScheduleId() {
      return (this.scheduleId);
   }
   public void setScheduleId(String scheduleId) {
      this.scheduleId = scheduleId;
   }

   /* Schedule Name */
   private String scheduleName = null;
   public String getScheduleName() {
      return (this.scheduleName);
   }
   public void setScheduleName(String scheduleName) {
      this.scheduleName = scheduleName;
   }

   /* Username */
   private String username = null;
   public String getUsername() {
      return (this.username);
   }
   public void setUsername(String username) {
      this.username = username;
   }

   /* Full Name */
   private String fullname = null;
   public String getFullname() {
      return (this.fullname);
   }
   public void setFullname(String fullname) {
      this.fullname = fullname;
   }

   /* Week Of Date MM/DD/YYYY */
   private String weekOfDate = null;
   public String getWeekOfDate() {
      return (this.weekOfDate);
   }
   public void setWeekOfDate(String weekOfDate) {
      this.weekOfDate = weekOfDate;
   }
   
   private String[] dates = {"", "", "", "", ""};
   public String getDateIndexed(int index) {
      return (this.dates[index]);
   }
   public void setDateIndexed(int index, String date) {
      this.dates[index] = date;
   }
   public String getDateIndexedNoYear(int index) {
      return (this.dates[index].substring(0,5));
   }

   /* Type (Individual/Master) */
   private String type = null;
   public String getType() {
      return (this.type);
   }
   public void setType(String type) {
      this.type = type;
   }

   /* Way (Detail/Tabular) */
   private String way = null;
   public String getWay() {
      return (this.way);
   }
   public void setWay(String way) {
      this.way = way;
   }


   void reset() {
   }

   public ActionErrors validate(ActionMapping mapping,
                        HttpServletRequest request) {

      ActionErrors errors = new ActionErrors();

   javax.sql.DataSource dataSource;
   java.sql.Connection myConnection = null;
   String start = null;
   String end = null;

   try {
      dataSource = servlet.findDataSource(null);
      myConnection = dataSource.getConnection();

      Statement stmt = myConnection.createStatement();
      
      String sql = "SELECT DATE_FORMAT(start_date, '%m/%d/%Y') AS start_date, ";
            sql += "       DATE_FORMAT(end_date, '%m/%d/%Y') AS end_date ";
            sql += "FROM schedules WHERE ";
            sql += "schedule_id = " + scheduleId;

      ResultSet rs = stmt.executeQuery(sql);
      rs.next();
      start = rs.getString("start_date");
      end = rs.getString("end_date");

   } catch (SQLException sqle) {
      sqle.printStackTrace();
   } finally {
      //enclose this in a finally block to make
      //sure the connection is closed
      try {
         myConnection.close();
      } catch (SQLException e) {
         e.printStackTrace();
      }
   }

   HDSDate weekOf = null;
   HDSDate startDate = new HDSDate(start);
   HDSDate endDate = new HDSDate(end);

   // Check weekOfDate required
   if ((weekOfDate == null) || (weekOfDate.length() < 1))
      errors.add("weekOfDate",
                 new ActionError("error.weekOfDate.required"));
   else {
      weekOf = new HDSDate(weekOfDate);
      // Check weekOfDate format
      if (!(weekOf.isValidDate()))
         errors.add("weekOfDate",
                     new ActionError("error.weekOfDate.format",
                                     weekOfDate));
      // Check weekOfDate = monday
      else if (!(weekOf.isMonday()))
         errors.add("weekOfDate",
                     new ActionError("error.weekOfDate.monday",
                                     weekOfDate));

      // Check weekOfDate between start and end
      else if (!(weekOf.isBetween(startDate, endDate)))
         errors.add("weekOfDate",
                     new ActionError("error.weekOfDate.between",
                                     weekOfDate));
   }
      return errors;
   }
}
