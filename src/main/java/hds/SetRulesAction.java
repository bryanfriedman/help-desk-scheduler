package hds;

import java.sql.*;
import java.util.*;
import javax.servlet.http.*;
import org.apache.struts.action.*;

public final class SetRulesAction extends Action {

  public ActionForward perform(ActionMapping mapping,
      ActionForm form,
      HttpServletRequest request,
      HttpServletResponse response) {
   
   javax.sql.DataSource dataSource;
   java.sql.Connection myConnection = null;
	HttpSession session = request.getSession();
   RulesForm f = (RulesForm) form;

   // Was this transaction cancelled?
	if (isCancelled(request)) {
	    if (mapping.getAttribute() != null)
	        session.removeAttribute(mapping.getAttribute());
	    return (mapping.findForward("success"));
	}

   ActionErrors errors = new ActionErrors();
	// Report any errors we have discovered back to the original form
	if (!errors.empty()) {
      saveErrors(request, errors);
      saveToken(request);
	   return (new ActionForward(mapping.getInput()));
	}

   Integer sched_id = (Integer) session.getAttribute("scheduleId");
   session.removeAttribute("scheduleId");
   String defaultRules = (String) session.getAttribute("default");
   session.removeAttribute("default");
   String tableName = null;
   if (defaultRules == null && sched_id == null) {
      System.out.println("both null");
      return (mapping.findForward("failure"));
   } else {
      if ("true".equals(defaultRules)) {
         tableName = "default_rules";
      } else {
         tableName = "rules";
      }
   }
   
   try {
      dataSource = servlet.findDataSource(null);
      myConnection = dataSource.getConnection();

      Statement stmt = myConnection.createStatement();
      String sql = null;

      // Clear default rules to set below
      if ("true".equals(defaultRules)) {
         stmt.executeUpdate("DELETE FROM default_rules");
      }

      String start, end, max, min, lead, student = null;
      for (int i = 0; i < 6; i++) {
         if (!("".equals(f.getStartTimeIndexed(i)))) {
            start = f.getStartTimeIndexed(i);
            end = f.getEndTimeIndexed(i);
            min = f.getMinIndexed(i);
            max = f.getMaxIndexed(i);
            lead = f.getLeadIndexed(i);
            student = f.getStudentIndexed(i);
            sql = "INSERT INTO " + tableName + " VALUES (NULL, ";
            if (!("true".equals(defaultRules)))
               sql += sched_id.toString() + ", ";
            sql += "'" + start + ":00', ";
            sql += "'" + end + ":00', ";
            sql += min + ", ";
            sql += max + ", ";
            sql += student + ", ";
            sql += lead + ")";
            stmt.executeUpdate(sql);
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


   // Forward control to the specified success target
   return (mapping.findForward("success"));

 }
}