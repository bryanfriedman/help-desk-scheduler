package hds;

import java.sql.*;
import java.util.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import jakarta.servlet.http.*;
import org.apache.struts.action.*;

public final class SetClassAction extends Action {

  public ActionForward execute(ActionMapping mapping,
      ActionForm form,
      HttpServletRequest request,
      HttpServletResponse response) throws Exception {

   DataSource dataSource;
   java.sql.Connection myConnection = null;
	HttpSession session = request.getSession();
   ClassForm f = (ClassForm) form;

   // Was this transaction cancelled?
	if (isCancelled(request)) {
	    if (mapping.getAttribute() != null)
	        session.removeAttribute(mapping.getAttribute());
	    return (mapping.findForward("index"));
	}

   boolean[][] weekdays = new boolean[6][5];
   for (int i = 0; i < 6; i++) {
      for (int j = 0; j < 5; j++) {
         weekdays[i][j] = false;
      }
   }

   String[] dow = f.getDaysOfWeek();

   for (int i = 0; i < dow.length; i++) {
      if (!(dow[i].equals(""))) {
         int lastIndex = dow[i].length() - 1;
         String day = dow[i].substring(lastIndex);
         String idx = dow[i].substring(0, lastIndex - 1);
         int a = Integer.parseInt(idx);
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
         weekdays[a][b] = true;
      }
   }
   
   String sql = null;
   String schedule_id = (String) session.getAttribute("scheduleId");
   String username = request.getRemoteUser();
   String[] days = {"M", "T", "W", "R", "F"};
   Vector sqlStmts = new Vector();
   
   for (int j = 0; j < 5; j++) {
      for (int i = 0; i < 6; i++) {
         if (weekdays[i][j]) {
             sql = "INSERT INTO avail VALUES (NULL, ";
            sql += schedule_id + ", '" + username + "', '";
            sql += days[j] + "', '";
            sql += f.getStartTimeIndexed(i) + ":00', '";
            sql += f.getEndTimeIndexed(i) + ":00', '";
            sql += f.getLabelIndexed(i) + "')";
            sqlStmts.add(sql);
         }
      }
   }

   try {
      dataSource = (DataSource) ((Context) new InitialContext().lookup("java:comp/env")).lookup("jdbc/hds");
      myConnection = dataSource.getConnection();

      Statement stmt = myConnection.createStatement();


       sql = "DELETE FROM avail WHERE ";
      sql += "username = '" + username + "' AND ";
      sql += "schedule_id = " + schedule_id;
      stmt.executeUpdate(sql);

      for (int i = 0; i < sqlStmts.size(); i++) {
         stmt.executeUpdate((String) sqlStmts.elementAt(i));
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

   // Forward control to the specified success target
   return (mapping.findForward("success"));

  }
}