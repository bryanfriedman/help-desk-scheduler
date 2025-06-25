package hds.accounts;

import java.sql.*;
import java.util.*;
import java.io.*;
import javax.servlet.http.*;
import org.apache.struts.action.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

public final class DeleteAccountAction extends Action {

  public ActionForward perform(ActionMapping mapping,
      ActionForm form,
      HttpServletRequest request,
      HttpServletResponse response) {

   if (!(request.isUserInRole("A"))) {
      return (mapping.findForward("privileges"));
   }

   javax.sql.DataSource dataSource;
   java.sql.Connection myConnection = null;
   HttpSession session = request.getSession();
   String user = request.getParameter("username");
   String adminEmail = null;

   // Populate the form
	if (form == null) {
	   form = new AccountsForm();
      if ("request".equals(mapping.getScope()))
         request.setAttribute(mapping.getAttribute(), form);
      else
         session.setAttribute(mapping.getAttribute(), form);
	}

   AccountsForm f = (AccountsForm) form;

   // Was this transaction cancelled?
	if (isCancelled(request)) {
	    if (mapping.getAttribute() != null)
	        session.removeAttribute(mapping.getAttribute());
	    return (mapping.findForward("success"));
	}

   try {
      dataSource = servlet.findDataSource(null);
      myConnection = dataSource.getConnection();
   
      Statement stmt = myConnection.createStatement();
      String sql = null;

      int priority = 0;
      int max = 0;
      if (!("A".equals(f.getType()))) {       
          sql = "SELECT priority FROM users WHERE username = ";
         sql += "'" + f.getUsername() + "'";
         ResultSet rs = stmt.executeQuery(sql);
         rs.next();
         priority = rs.getInt("priority");

         sql = "SELECT MAX(priority) AS priority FROM users";
         rs = stmt.executeQuery(sql);
         rs.next();
         max = rs.getInt("priority");
      }

      // Get admin e-mail
      sql = "SELECT email FROM users WHERE username = 'admin'";
      ResultSet rs = stmt.executeQuery(sql);
      rs.next();
      adminEmail = rs.getString("email");

      sql = "DELETE FROM users WHERE username = '" + f.getUsername() + "'";
      stmt.executeUpdate(sql);

      for (int i = priority + 1; i <= max; i++) {
          sql = "UPDATE users SET priority = ";
         sql += Integer.toString(i-1) + " WHERE ";
         sql += "priority = " + Integer.toString(i);
         stmt.executeUpdate(sql);
      }

      sql = "DELETE FROM roles WHERE username = '" + f.getUsername() + "'";
      stmt.executeUpdate(sql);
      sql = "DELETE FROM avail WHERE username = '" + f.getUsername() + "'";
      stmt.executeUpdate(sql);
      sql = "DELETE FROM prefer WHERE username = '" + f.getUsername() + "'";
      stmt.executeUpdate(sql);
      sql = "DELETE FROM desired WHERE username = '" + f.getUsername() + "'";
      stmt.executeUpdate(sql);
      sql = "DELETE FROM master WHERE username = '" + f.getUsername() + "'";
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
   
   // E-mail the user with the information

   String admin = adminEmail;
	String to = f.getEmail();
	String from = adminEmail;
	String host = "maildev";  // Change based on location
   String port = "1025";
   String subject = "Help Desk Scheduler Account Deleted";

   String type = null;
   if ("A".equals(f.getType())) {
      type = "Administrator";
   } else if ("L".equals(f.getType())) {
      type = "Lead Student";
   } else if ("S".equals(f.getType())) {
      type = "Student Assistant";
   }

   String body = "Your Help Desk Scheduler Account '";
         body += f.getUsername() + "' has been deleted.\n";
         body += "\n";
         body += "If you have any questions or problems, you can respond to the ";
         body += "HDS Administrator at " + adminEmail + " for more information.\n";

   // create some properties and get the default Session
	Properties props = new Properties();
	props.put("mail.smtp.host", host);
	props.put("mail.smtp.port", port);
	javax.mail.Session mailSession = Session.getDefaultInstance(props, null);
	
	try {
	    // create a message
	    javax.mail.Message msg = new MimeMessage(mailSession);
	    msg.setFrom(new InternetAddress(from));
	    InternetAddress[] address = {new InternetAddress(to), new InternetAddress(admin)};
	    msg.setRecipients(Message.RecipientType.TO, address);
	    msg.setSubject(subject);
	    msg.setSentDate(new java.util.Date());
	    msg.setText(body);
	    Transport.send(msg);
	} catch (MessagingException mex) {
      request.setAttribute("exception", mex.getMessage());
      return (mapping.findForward("failure"));
   }

   // Forward control to the specified success target
   return (mapping.findForward("success"));

  }
}