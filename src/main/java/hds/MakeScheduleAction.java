package hds;

import java.sql.*;
import java.util.*;
import javax.servlet.http.*;
import org.apache.struts.action.*;
import hds.HDSDate;

public final class MakeScheduleAction extends Action {

  public ActionForward perform(ActionMapping mapping,
      ActionForm form,
      HttpServletRequest request,
      HttpServletResponse response) {
   
   javax.sql.DataSource dataSource;
   java.sql.Connection myConnection = null;
	HttpSession session = request.getSession();
   ScheduleForm f = (ScheduleForm) form;

   // Was this transaction cancelled?
	if (isCancelled(request)) {
	    if (mapping.getAttribute() != null)
	        session.removeAttribute(mapping.getAttribute());
       session.setAttribute("defaultRules", "T");  // skip the rules screen
	    return (mapping.findForward("success"));
	}

   ActionErrors errors = new ActionErrors();
	// Report any errors we have discovered back to the original form
	if (!errors.empty()) {
      saveErrors(request, errors);
      saveToken(request);
	   return (new ActionForward(mapping.getInput()));
	}

   HDSDate start = new HDSDate(f.getStartDate());
   HDSDate end = new HDSDate(f.getEndDate());

   String def = null;
   if (f.getDefaultRules()) {
      def = "T";
   } else {
      def = "F";
   }

   int sched_id = 0;
   try {
      dataSource = servlet.findDataSource(null);
      myConnection = dataSource.getConnection();

      Statement stmt = myConnection.createStatement();

      String sql = "INSERT INTO schedules VALUES ";
            sql += "(NULL, '" + f.getName() + "', '";
            sql += start.toMySQL() + "', '";
            sql += end.toMySQL() + "', ";
            sql += "'" + def + "')";

      stmt.executeUpdate(sql);

      sql = "SELECT LAST_INSERT_ID() AS id";

      ResultSet rs = stmt.executeQuery(sql);
      rs.next();
      sched_id = rs.getInt("id");

       sql = "INSERT INTO holidays VALUES (NULL, ";
      sql += Integer.toString(sched_id) + ", ";

      HDSDate h = null;
      for (int i = 0; i < 8; i++) {
         h = new HDSDate(f.getHolidayIndexed(i));
         if (!("".equals(f.getHolidayIndexed(i)))) {
            stmt.executeUpdate(sql + "'" + h.toMySQL() + "')");
         }
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

   session.setAttribute("defaultRules", def);
   session.setAttribute("scheduleId", new Integer(sched_id));

   // Forward control to the specified success target
   return (mapping.findForward("success"));

  }
}