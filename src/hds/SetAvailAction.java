package hds;

import java.sql.*;
import java.util.*;
import javax.servlet.http.*;
import org.apache.struts.action.*;

public final class SetAvailAction extends Action {

  public ActionForward perform(ActionMapping mapping,
      ActionForm form,
      HttpServletRequest request,
      HttpServletResponse response) {

   javax.sql.DataSource dataSource;
   java.sql.Connection myConnection = null;
	HttpSession session = request.getSession();
   AvailForm f = (AvailForm) form;

   // Was this transaction cancelled?
	if (isCancelled(request)) {
	    if (mapping.getAttribute() != null)
	        session.removeAttribute(mapping.getAttribute());
	    return (mapping.findForward("index"));
	}

   boolean checked = false;
   String when = (String) request.getParameter("when");
   if ("amnot".equals(when)) {
      checked = false;
   } else if ("am".equals(when)) {
      checked = true;
   }

   boolean[][] weekdays = new boolean[11][5];
   for (int i = 0; i < 11; i++) {
      for (int j = 0; j < 5; j++) {
         weekdays[i][j] = checked;
      }
   }

   String[] dow = f.getDaysOfWeek();

   for (int i = 0; i < dow.length; i++) {
      if (!(dow[i].equals(""))) {
         int lastIndex = dow[i].length() - 1;
         String day = dow[i].substring(lastIndex);
         String time = dow[i].substring(0, lastIndex - 1);
         int a = Integer.parseInt(time);
         int b = 0;
         if (day.equals("M"))
             b = 0;
         else if (day.equals("T"))
             b = 1;
         else if (day.equals("W"))
             b = 2;
         else if (day.equals("R"))
             b = 3;
         else if (day.equals("F"))
             b = 4;
         weekdays[a][b] = (!checked);
      }
   }
   
   String sql = null;
   String schedule_id = (String) session.getAttribute("scheduleId");
   String username = request.getRemoteUser();
   String[] days = {"M", "T", "W", "R", "F"};
   Vector sqlStmts = new Vector();
   
   int start = 0;
   int end = 0;
   for (int j = 0; j < 5; j++) {
      for (int i = 0; i < 11; i++) {
         if (weekdays[i][j] && start == 0 && i < 10) {
            start = i + 8;
         } else if (weekdays[i][j] && start == 0 && i == 10) {
            start = 18;
            end = 19;
         } else if (weekdays[i][j] && start > 0 && i == 10) {
            end = 19;
         } else if (!weekdays[i][j] && start > 0) {
            end = i + 8;
         }

         if (start > 0 && end > 0) {
             sql = "INSERT INTO avail VALUES (NULL, ";
            sql += schedule_id + ", '" + username + "', '";
            sql += days[j] + "', '" + start + ":00', '";
            sql += end + ":00', NULL)";
            sqlStmts.add(sql);
            start = 0;
            end = 0;
         }
      }
      start = 0;
      end = 0;
   }

   try {
      dataSource = servlet.findDataSource(null);
      myConnection = dataSource.getConnection();

      Statement stmt = myConnection.createStatement();

       sql = "DELETE FROM avail WHERE ";
      sql += "username = '" + username + "' AND ";
      sql += "schedule_id = " + schedule_id;
      stmt.executeUpdate(sql);

      for (int i = 0; i < sqlStmts.size(); i++) {
         stmt.executeUpdate((String) sqlStmts.elementAt(i));
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

   // Forward control to the specified success target
   return (mapping.findForward("success"));

  }
}