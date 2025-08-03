package hds.accounts;

import javax.servlet.http.*;
import java.text.*;
import org.apache.struts.action.*;
import hds.HDSDate;

public final class AccountsForm extends ActionForm {

   /* Action (create, modify) */
   private String action = null;
   public String getAction() {
      return (this.action);
   }
   public void setAction(String action) {
      this.action = action;
   }

   /* Account Name */
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

   /* E-Mail */
   private String email = null;
   public String getEmail() {
      return (this.email);
   }
   public void setEmail(String email) {
      this.email = email;
   }

   /* Account Type */
   private String type = null;
   public String getType() {
      return (this.type);
   }
   public void setType(String type) {
      this.type = type;
   }

   /* Password */
   private String password = null;
   public String getPassword() {
      return (this.password);
   }
   public void setPassword(String password) {
      this.password = password;
   }

   /* Start Date */
   private String startDate = null;
   public String getStartDate() {
      return (this.startDate);
   }
   public void setStartDate(String startDate) {
      this.startDate = startDate;
   }

   /* Create Date */
   private String createDate = null;
   public String getCreateDate() {
      return (this.createDate);
   }
   public void setCreateDate(String createDate) {
      this.createDate = createDate;
   }

   /* Priority */
   private int priority = 0;
   public int getPriority() {
      return (this.priority);
   }
   public void setPriority(int priority) {
      this.priority = priority;
   }

   private boolean active = true;
   public boolean getActive() {
      return (this.active);
   }
   public void setActive(boolean active) {
      this.active = active;
   }


public void reset(ActionMapping mapping,
         HttpServletRequest request) {
   this.active = false;
}

public ActionErrors validate(ActionMapping mapping,
                        HttpServletRequest request) {

   ActionErrors errors = new ActionErrors();
   if ((username == null) || (username.length() < 1))
      errors.add("username",
                 new ActionError("error.username.required"));
   if ((fullname == null) || (fullname.length() < 1))
      errors.add("fullname",
                 new ActionError("error.fullname.required"));
   if ((email == null) || (email.length() < 1))
      errors.add("email",
                 new ActionError("error.email.required"));
   else {
      int atSign = email.indexOf("@");
      if ((atSign < 1) || (atSign >= (email.length() - 1)))
         errors.add("email",
                     new ActionError("error.email.format",
                                     email));
   }

   if (password.length() < 6 && password.length() > 0)
         errors.add("password",
                    new ActionError("error.password.length"));

   if ("create".equals(action)) {
      if ((password == null) || (password.length() < 1))
         errors.add("password",
                    new ActionError("error.password.required"));

      HDSDate start = null;
      if ((startDate == null) || (startDate.length() < 1))
         errors.add("startDate",
                    new ActionError("error.startDate.required"));
      else {
         start = new HDSDate(startDate);
         if (!(start.isValidDate()))
            errors.add("startDate",
                        new ActionError("error.startDate.format",
                                        startDate));
         else if (!(start.isWeekday()))
            errors.add("startDate",
                        new ActionError("error.startDate.weekday",
                                        startDate));
         
      }

   }   

   return errors;

}

}
