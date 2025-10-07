package hds.accounts;

import java.sql.*;
import java.io.*;
import java.util.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.text.*;
import jakarta.servlet.http.*;
import org.apache.struts.action.*;
import jakarta.mail.*;
import jakarta.mail.internet.*;
import jakarta.activation.*;
import hds.HDSDate;

public final class MakeAccountAction extends Action {

  public ActionForward execute(ActionMapping mapping,
      ActionForm form,
      HttpServletRequest request,
      HttpServletResponse response) throws Exception {

   DataSource dataSource;
   java.sql.Connection myConnection = null;
	HttpSession session = request.getSession();
   AccountsForm f = (AccountsForm) form;
   String adminEmail = null;

   // Was this transaction cancelled?
	if (isCancelled(request)) {
	    if (mapping.getAttribute() != null)
	        session.removeAttribute(mapping.getAttribute());
	    return (mapping.findForward("success"));
	}

   ActionErrors errors = new ActionErrors();
	// Report any errors we have discovered back to the original form
	if (!errors.isEmpty()) {
      saveErrors(request, errors);
      saveToken(request);
	   return (new ActionForward(mapping.getInput()));
	}      

   try {
      dataSource = (DataSource) ((Context) new InitialContext().lookup("java:comp/env")).lookup("jdbc/hds");
      myConnection = dataSource.getConnection();

      Statement stmt = myConnection.createStatement();

      // Get admin e-mail
      String sql = "SELECT email FROM users WHERE username = 'admin'";
      ResultSet rs = stmt.executeQuery(sql);
      rs.next();
      adminEmail = rs.getString("email");

      if ("create".equals(f.getAction())) {
         
         // Check for duplicate user
         sql = "SELECT username, email FROM users";
         rs = stmt.executeQuery(sql);
         Vector userList = new Vector();
         Vector emailList = new Vector();
         while (rs.next()) {
            userList.add(rs.getString("username"));
            emailList.add(rs.getString("email"));
         }
         if (userList.contains(f.getUsername())) {
            errors.add("username", 
               new ActionMessage("error.username.duplicate"));
            saveErrors(request, errors);
            saveToken(request);
	         return (new ActionForward(mapping.getInput()));
         }
         if (emailList.contains(f.getEmail())) {
            errors.add("email", 
               new ActionMessage("error.email.duplicate"));
            saveErrors(request, errors);
            saveToken(request);
	         return (new ActionForward(mapping.getInput()));
         }

         // Format Date
         HDSDate startDate = new HDSDate(f.getStartDate());
         String start_date = startDate.toMySQL();
   
         String priority = null;
         if ("A".equals(f.getType())) {
            priority = "NULL";
         } else {
            sql = "SELECT MAX(priority) AS priority FROM users";
            stmt = myConnection.createStatement();
            rs = stmt.executeQuery(sql);
            rs.next();
            priority = Integer.toString(rs.getInt("priority") + 1);
         }

          sql = "INSERT INTO users (username, fullname, ";
         sql += "start_date, priority, email, ";
         sql += "passwd, active) VALUES (";
         sql += "'" + f.getUsername() + "', ";
         sql += "'" + f.getFullname() + "', ";
         sql += "'" + start_date + "', ";
         sql += priority + ", ";
         sql += "'" + f.getEmail() + "', ";
         sql += "MD5('" + f.getPassword() + "'), "; 
         sql += "'T')";

         stmt.executeUpdate(sql);

          sql = "INSERT INTO roles (username, role) VALUES (";
         sql += "'" + f.getUsername() + "', ";
         sql += "'" + f.getType() + "')";

         stmt.executeUpdate(sql);

      } else if ("modify".equals(f.getAction())) {

          sql = "SELECT role FROM roles WHERE username = ";
         sql += "'" + f.getUsername() + "'";
         rs = stmt.executeQuery(sql);
         rs.next();
         String role = rs.getString("role");

         String priority = null;
         if ("A".equals(f.getType()) && "A".equals(role)) {  // Admin to Admin
            priority = "NULL";

         // Student to Admin (set null priority and move everyone up)
         } else if ("A".equals(f.getType()) && (!("A".equals(role)))) {
            
            int p = 0;
            int max = 0;

            // Get current student priority
             sql = "SELECT priority FROM users WHERE username = ";
            sql += "'" + f.getUsername() + "'";
            rs = stmt.executeQuery(sql);
            rs.next();
            p = rs.getInt("priority");

            // Get max priority
            sql = "SELECT MAX(priority) AS priority FROM users";
            rs = stmt.executeQuery(sql);
            rs.next();
            max = rs.getInt("priority");

            // Nullify current priority
             sql = "UPDATE users SET priority = NULL WHERE username = ";
            sql += "'" + f.getUsername() + "'";
            stmt.executeUpdate(sql);

            // Move everyone up
            for (int i = p + 1; i <= max; i++) {
                sql = "UPDATE users SET priority = ";
               sql += Integer.toString(i-1) + " WHERE ";
               sql += "priority = " + Integer.toString(i);
               stmt.executeUpdate(sql);
            }

         } else {
            if ("A".equals(role)) {    // Admin to student (set max priority)
               sql = "SELECT MAX(priority) AS priority FROM users";
               rs = stmt.executeQuery(sql);
               rs.next();
               priority = Integer.toString(rs.getInt("priority") + 1);
            } else {                   // Student to student (set same priority)
                sql = "SELECT priority FROM users WHERE username = ";
               sql += "'" + f.getUsername() + "'";
               rs = stmt.executeQuery(sql);
               rs.next();
               priority = Integer.toString(rs.getInt("priority"));
            }
         }

         String active = null;
         if (!f.getActive()) {
            active = "F";
         } else {
            active = "T";
         }

         /* Set password */
         String pw = null;
         if (f.getPassword() == null || f.getPassword().length() < 1) {
             sql = "SELECT passwd FROM users WHERE username = ";
            sql += "'" + f.getUsername() + "'";
            rs = stmt.executeQuery(sql);
            rs.next();
            pw = rs.getString("passwd");

            sql = "UPDATE users SET ";
           sql += "priority = " + priority + ", ";
           sql += "active = '" + active + "', ";
           sql += "fullname = '" + f.getFullname() + "', ";
           sql += "email = '" + f.getEmail() + "', ";
           sql += "passwd = '" + pw + "' ";
           sql += "WHERE username = ";
           sql += "'" + f.getUsername() + "'";

         } else {
            pw = f.getPassword();

            sql = "UPDATE users SET ";
           sql += "priority = " + priority + ", ";
           sql += "active = '" + active + "', ";
           sql += "fullname = '" + f.getFullname() + "', ";
           sql += "email = '" + f.getEmail() + "', ";
           sql += "passwd = MD5('" + pw + "') ";
           sql += "WHERE username = ";
           sql += "'" + f.getUsername() + "'";
         
         }

         stmt.executeUpdate(sql);

          sql = "UPDATE roles SET ";
         sql += "role = '" + f.getType() + "' ";
         sql += "WHERE username = ";
         sql += "'" + f.getUsername() + "'";

         stmt.executeUpdate(sql);

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

   // E-mail the user with the information

   String admin = adminEmail;
	String to = f.getEmail();
	String from = adminEmail;
	String host = "maildev";  // Change based on location
   String port = "1025";
   String subject = "Help Desk Scheduler Account ";

   if ("modify".equals(f.getAction())) {
      subject += "Modified";
   } else if ("create".equals(f.getAction())) {
      subject += "Created";
   }

   String type = null;
   if ("A".equals(f.getType())) {
      type = "Administrator";
   } else if ("L".equals(f.getType())) {
      type = "Lead Student";
   } else if ("S".equals(f.getType())) {
      type = "Student Assistant";
   }

   String active = null;
   if (f.getActive()) {
      active = "active";
   } else {
      active = "NOT active";
   }

   String passwd = null;
   if (f.getPassword().length() < 1) {
      passwd = "[not changed]";
   } else {
      passwd = f.getPassword();
   }

   // Possible additions to this message:
   //    Link to login page
   //    Take to login page and fill in fields
   String body = "Here is your Help Desk Scheduler Account Information:\n";
         body += "\n";
         body += "      Full Name: " + f.getFullname() + "\n";
         body += "       Username: " + f.getUsername() + "\n";
         body += "       Password: " + passwd + "\n";
         body += "   Account Type: " + type + "\n";
         if ("create".equals(f.getAction()))
            body += "Work Start Date: " + f.getStartDate() + "\n";
         if ("modify".equals(f.getAction()))
            body += "Your account is: " + active + ".\n";        
         body += "\n";
         body += "If your password has been reset, you should change it ";
         body += "next time you login to the Help Desk Scheduler. ";
         body += "To do so, login with the username and password shown above, ";
         body += "and click the 'Change Password' button on the menu to the left. ";
         body += "You will then be prompted to enter a new password. ";
         body += "Your password must be 6-8 characters, but otherwise, ";
         body += "there are no restrictions.\n";
         body += "\n";
         body += "If you have any questions or problems, you can respond to the ";
         body += "HDS Administrator at " + adminEmail + " for more information.\n";


   // create some properties and get the default Session
	Properties props = new Properties();
	props.put("mail.smtp.host", host);
	props.put("mail.smtp.port", port);
	jakarta.mail.Session mailSession = Session.getDefaultInstance(props, null);
	
	try {
	    // create a message
	    jakarta.mail.Message msg = new MimeMessage(mailSession);
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

   String page = null;
   if (request.isUserInRole("S")) {
      page = "index";
   } else {
      page = "success";
   }

   // Forward control to the specified success URI
	return (mapping.findForward(page));

   }

}

