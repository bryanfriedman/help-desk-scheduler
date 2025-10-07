package hds;

import jakarta.servlet.http.*;
import java.lang.*;
import org.apache.struts.action.*;

public final class ScheduleForm extends ActionForm {

   /* Schedule ID */
   private String id = null;
   public String getId() {
      return (this.id);
   }
   public void setId(String id) {
      this.id = id;
   }

   /* Schedule Name */
   private String name = null;
   public String getName() {
      return (this.name);
   }
   public void setName(String name) {
      this.name = name;
   }

   /* Start Date MM/DD/YYYY */
   private String startDate = null;
   public String getStartDate() {
      return (this.startDate);
   }
   public void setStartDate(String startDate) {
      this.startDate = startDate;
   }

   /* End Date MM/DD/YYYY */
   private String endDate = null;
   public String getEndDate() {
      return (this.endDate);
   }
   public void setEndDate(String endDate) {
      this.endDate = endDate;
   }

   /* Holiday 1 MM/DD/YYYY */
   private String holidays[] = {"", "", "", "", 
                                "", "", "", ""};
   public String getHolidayIndexed(int index) {
      return (this.holidays[index]);
   }
   public void setHolidayIndexed(int index, String holiday) {
      this.holidays[index] = holiday;
   }

   private boolean defaultRules = false;
   public boolean getDefaultRules() {
      return (this.defaultRules);
   }
   public void setDefaultRules(boolean defaultRules) {
      this.defaultRules = defaultRules;
   }


   void reset() {
      this.defaultRules = false;
   }


   public ActionErrors validate(ActionMapping mapping,
                           HttpServletRequest request) {
   
   ActionErrors errors = new ActionErrors();
   // Check name required
   if ((name == null) || (name.length() < 1))
         errors.add("name",
                 new ActionMessage("error.schedulename.required"));

   
   HDSDate start = null;
   HDSDate today = new HDSDate();
   // Check start date required
   if ((startDate == null) || (startDate.length() < 1))
      errors.add("startDate",
                 new ActionMessage("error.startDate.required"));
   else {
      start = new HDSDate(startDate);
      // Check start date format
      if (!(start.isValidDate()))
         errors.add("startDate",
                     new ActionMessage("error.startDate.format",
                                     startDate));
      // Check start = monday
      else if (!(start.isMonday()))
         errors.add("startDate",
                     new ActionMessage("error.startDate.monday",
                                     startDate));

      // Check start > today
      else if (!(start.isAfter(today)))
         errors.add("startDate",
                     new ActionMessage("error.startDate.afterToday",
                                     startDate));
   }

   HDSDate end = null;
   // Check end date required
   if ((endDate == null) || (endDate.length() < 1))
      errors.add("endDate",
                 new ActionMessage("error.endDate.required"));
   else {
      end = new HDSDate(endDate);
      // Check end date format
      if (!(end.isValidDate()))
         errors.add("endDate",
                     new ActionMessage("error.endDate.format",
                                     endDate));
      // Check end = friday
      else if (!(end.isFriday()))
         errors.add("startDate",
                     new ActionMessage("error.endDate.friday",
                                     endDate));
   }

   if (((endDate != null) && (endDate.length() > 0)) &&
      ((startDate != null) && (startDate.length() > 0))) {
      // Check start < end
      if (!(end.isAfter(start)))
         errors.add("endDate",
                     new ActionMessage("error.endDate.afterStart",
                                     endDate));

      HDSDate holiday = null;
      for (int i = 0; i < 8; i++) {
         if (holidays[i] != null && holidays[i].length() > 0) {
            holiday = new HDSDate(holidays[i]);
            // Check holiday date format
            if (!(holiday.isValidDate()))
               errors.add("holidays",
                           new ActionMessage("error.holiday.format",
                                           holidays[i]));
            // Check holiday between start and end
            else if (!(holiday.isBetween(start, end)))
               errors.add("holidays",
                           new ActionMessage("error.holiday.between",
                                          holidays[i]));
         }
      }
   }


   return errors;

   }

}




