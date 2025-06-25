package hds;

import java.sql.*;
import java.util.*;
import javax.servlet.http.*;
import org.apache.struts.action.*;

public final class SetPrefsAction extends Action {

  public ActionForward perform(ActionMapping mapping,
      ActionForm form,
      HttpServletRequest request,
      HttpServletResponse response) {
  
   javax.sql.DataSource dataSource;
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
	if (!errors.empty()) {
      saveErrors(request, errors);
      saveToken(request);
	   return (new ActionForward(mapping.getInput()));
	}
   
   String username = request.getRemoteUser();

   try {
      dataSource = servlet.findDataSource(null);
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

   session.setAttribute("scheduleId", f.getScheduleId());

   // Forward control to the specified success target
   return (mapping.findForward(g));

  }
}