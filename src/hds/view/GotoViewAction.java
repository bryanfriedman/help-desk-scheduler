package hds.view;

import java.sql.*;
import java.util.*;
import java.text.*;
import javax.servlet.http.*;
import org.apache.struts.action.*;
import hds.HDSDate;

public final class GotoViewAction extends Action {

  public ActionForward perform(ActionMapping mapping,
      ActionForm form,
      HttpServletRequest request,
      HttpServletResponse response) {

   javax.sql.DataSource dataSource;
   java.sql.Connection myConnection = null;   
   HttpSession session = request.getSession();
   ViewScheduleForm f = (ViewScheduleForm) form;
   String page = null;

   // Was this transaction cancelled?
	if (isCancelled(request)) {
	    if (mapping.getAttribute() != null)
	        session.removeAttribute(mapping.getAttribute());
	    return (mapping.findForward("index"));
	}

   ActionErrors errors = new ActionErrors();
	// Report any errors we have discovered back to the original form
	if (!errors.empty()) {
      saveErrors(request, errors);
      saveToken(request);
	   return (new ActionForward(mapping.getInput()));
	}

   String monday = f.getWeekOfDate();
   String day = null;

   HDSDate monDate = new HDSDate(monday);
   f.setDateIndexed(0, monday);

   Calendar cal = Calendar.getInstance();
   cal.setTime(monDate.toDate());
   
   for (int i = 1; i < 5; i++) {
      cal.add(Calendar.DATE, 1);
      java.util.Date tempDate = cal.getTime();
      try {
         SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
         sdf.setLenient(false);
         day = sdf.format(tempDate);
         f.setDateIndexed(i, day);
      } catch (Exception e) {
         request.setAttribute("exception", "Date conversion error.");
         return (mapping.findForward("failure"));
      }
   }

   try {
      dataSource = servlet.findDataSource(null);
      myConnection = dataSource.getConnection();
      Statement stmt = myConnection.createStatement();
      String sql = "SELECT schedule_name ";
            sql += "FROM schedules WHERE ";
            sql += "schedule_id = " + f.getScheduleId();

      ResultSet rs = stmt.executeQuery(sql);
      rs.next();
      f.setScheduleName(rs.getString("schedule_name"));

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


   if ("master".equals(f.getType())) {
      page = "tabular";
   } else if ("individual".equals(f.getType())) {
      try {
         dataSource = servlet.findDataSource(null);
         myConnection = dataSource.getConnection();
         Statement stmt = myConnection.createStatement();
         String sql = "SELECT fullname ";
               sql += "FROM users WHERE ";
               sql += "username = '" + f.getUsername() + "'";

         ResultSet rs = stmt.executeQuery(sql);
         rs.next();
         f.setFullname(rs.getString("fullname"));
   
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
      
      page = f.getWay();

   }

   //return (mapping.findForward("detail"));  
   return (mapping.findForward(page));  

  }
}