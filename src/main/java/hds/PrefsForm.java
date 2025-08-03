package hds;

import javax.servlet.http.*;
import java.lang.*;
import org.apache.struts.action.*;

public final class PrefsForm extends ActionForm {

   /* Schedule ID */
   private String scheduleId = null;
   public String getScheduleId() {
      return (this.scheduleId);
   }
   public void setScheduleId(String scheduleId) {
      this.scheduleId = scheduleId;
   }

   /* Minimum number of hours */
   private String minHours = null;
   public String getMinHours() {
      return (this.minHours);
   }
   public void setMinHours(String minHours) {
      this.minHours = minHours;
   }

   /* Maximum number of hours */
   private String maxHours = null;
   public String getMaxHours() {
      return (this.maxHours);
   }
   public void setMaxHours(String maxHours) {
      this.maxHours = maxHours;
   }


   void reset() {
      
   }


   public ActionErrors validate(ActionMapping mapping,
                           HttpServletRequest request) {
   
   ActionErrors errors = new ActionErrors();

   int min = 0;
   int max = 0;
   if ((minHours == null) || (minHours.length() < 1)) {
         errors.add("minHours",
                  new ActionError("error.min.required"));
   } else {
      try {
         min = Integer.parseInt(minHours);
      } catch (NumberFormatException e) {
         errors.add("minHours", new ActionError("error.min.number", minHours));
      }
      if (min < 1) {
         errors.add("minHours", new ActionError("error.min.greater"));
      }
   }
      
   if ((maxHours == null) || (maxHours.length() < 1)) {
      errors.add("maxHours",
               new ActionError("error.max.required"));
   } else {
      try {
         max = Integer.parseInt(maxHours);
      } catch (NumberFormatException e) {
         errors.add("maxHours", new ActionError("error.max.number", maxHours));
      }
      if (max < 1) {
         errors.add("maxHours", new ActionError("error.max.greater"));
      }
   }

   if (min > max) {
      errors.add("minHours", new ActionError("error.min.less"));
   }

   return errors;

   }

}




