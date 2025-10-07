package hds;

import java.sql.*;
import java.util.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import jakarta.servlet.http.*;
import org.apache.struts.action.*;

public final class SetPrefsAction extends Action {

  public ActionForward execute(ActionMapping mapping,
      ActionForm form,
      HttpServletRequest request,
      HttpServletResponse response) throws Exception {
  
   DataSource dataSource;
   java.sql.Connection myConnection = null;
	HttpSession session = request.getSession();
   PrefsForm f = (PrefsForm) form;
   String g = request.getParameter("enterBy");

   // Was this transaction cancelled?
	if (isCancelled(request)) {
	    if (mapping.getAttribute() != null)
	        session.removeAttribute(mapping.getAttribute());
	    return (mapping.findForward("index"));
	}

   ActionErrors errors = new ActionErrors();
	// Report any errors we have discovered back to the original form
	if (!errors.isEmpty()) {
      saveErrors(request, errors);
      saveToken(request);
	   return (new ActionForward(mapping.getInput()));
	}
   
   String username = request.getRemoteUser();

   try {
      dataSource = (DataSource) ((Context) new InitialContext().lookup("java:comp/env")).lookup("jdbc/hds");
      myConnection = dataSource.getConnection();
      
      Statement stmt = myConnection.createStatement();

      // Delete previous preferences
      String sql = "DELETE FROM desired WHERE ";
            sql += "schedule_id = " + f.getScheduleId();
            sql += " AND username = '" + username + "'";

      stmt.executeUpdate(sql);

       sql = "INSERT INTO desired VALUES (";
      sql += f.getScheduleId() + ", '";
      sql += username + "', ";
      sql += f.getMinHours() + ", ";
      sql += f.getMaxHours() + ")";

      stmt.executeUpdate(sql);
      
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

   session.setAttribute("scheduleId", f.getScheduleId());

   // Forward control to the specified success target
   return (mapping.findForward(g));

  }
}