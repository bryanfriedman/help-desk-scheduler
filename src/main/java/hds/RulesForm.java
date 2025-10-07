package hds;

import jakarta.servlet.http.*;
import java.lang.*;
import org.apache.struts.action.*;

public final class RulesForm extends ActionForm {

   /* Start Time 'HH:MM PM' */
   private String startTime[] = {"", "", "", "", 
                                 "", ""};
   public String getStartTimeIndexed(int index) {
      return (this.startTime[index]);
   }
   public void setStartTimeIndexed(int index, String startTime) {
      this.startTime[index] = startTime;
   }

   /* End Time 'HH:MM PM' */
   private String endTime[] = {"", "", "", "", 
                               "", ""};
   public String getEndTimeIndexed(int index) {
      return (this.endTime[index]);
   }
   public void setEndTimeIndexed(int index, String endTime) {
      this.endTime[index] = endTime;
   }

   /* Min Students */
   private String min[] = {"", "", "", "", 
                           "", ""};
   public String getMinIndexed(int index) {
      return (this.min[index]);
   }
   public void setMinIndexed(int index, String min) {
      this.min[index] = min;
   }

   /* Max Students */
   private String max[] = {"", "", "", "", 
                           "", ""};
   public String getMaxIndexed(int index) {
      return (this.max[index]);
   }
   public void setMaxIndexed(int index, String max) {
      this.max[index] = max;
   }

   /* Lead to */
   private String lead[] = {"", "", "", "", 
                            "", ""};
   public String getLeadIndexed(int index) {
      return (this.lead[index]);
   }
   public void setLeadIndexed(int index, String lead) {
      this.lead[index] = lead;
   }

   /* Student ratio */
   private String student[] = {"", "", "", "", 
                               "", ""};
   public String getStudentIndexed(int index) {
      return (this.student[index]);
   }
   public void setStudentIndexed(int index, String student) {
      this.student[index] = student;
   }


   void reset() {
      
   }


   public ActionErrors validate(ActionMapping mapping,
                           HttpServletRequest request) {
   
   ActionErrors errors = new ActionErrors();

   boolean noOverlaps = true;
   boolean startsLessThanEnds = true;

   for (int i = 0; i < 6; i++) {

      String rowi = startTime[i] + endTime[i] + min[i] +
                    max[i] + lead[i] + student[i];
      if (("".equals(startTime[i]) || 
           "".equals(endTime[i]) || 
           "".equals(min[i]) ||
           "".equals(max[i]) ||
           "".equals(lead[i]) ||
           "".equals(student[i])) && (!("".equals(rowi)))) {

         errors.add("startTime",
                 new ActionMessage("error.rules.fullrow"));

      } else if (!("".equals(rowi))) {

         int mn = 0;
         int mx = 0;
         int num = 0;
         try {
            mn = Integer.parseInt(min[i]);
         } catch (NumberFormatException e) {
            errors.add("min", new ActionMessage("error.min.number", min[i]));
         }
         if (mn < 1) {
            errors.add("min", new ActionMessage("error.min.greater"));
         }

         try {
            mx = Integer.parseInt(max[i]);
         } catch (NumberFormatException e) {
            errors.add("max", new ActionMessage("error.max.number", max[i]));
         }
         if (mx < 1) {
            errors.add("max", new ActionMessage("error.max.greater"));
         }

         if (mn > mx) {
            errors.add("min", new ActionMessage("error.min.less"));
         }

         try {
            num = Integer.parseInt(lead[i]);
         } catch (NumberFormatException e) {
            errors.add("lead", new ActionMessage("error.lead.number", lead[i]));
         }

         /* lead can be 0
         if (num < 1) {
            errors.add("lead", new ActionError("error.lead.greater"));
         } */

         try {
            num = Integer.parseInt(student[i]);
         } catch (NumberFormatException e) {
            errors.add("student", new ActionMessage("error.student.number", student[i]));
         }
         if (num < 1) {
            errors.add("student", new ActionMessage("error.student.greater"));
         }

         int start = Integer.parseInt(startTime[i]);
         int end = Integer.parseInt(endTime[i]);

         if (start >= end) {
            errors.add("startTime", new ActionMessage("error.rules.before"));
            startsLessThanEnds = false;
         }
      }
   }


   if (startsLessThanEnds) {

      // Initialize to all 100s like infinities
      int start[] = {-1, -1, -1, -1, -1, -1};
      int end[] = {-1, -1, -1, -1, -1, -1};

      for (int i = 0; i < 6; i++) {
         try {
            start[i] = Integer.parseInt(startTime[i]);
            end[i] = Integer.parseInt(endTime[i]);
         } catch (Exception e) {
            break; // error handled by first check above
         }
      }

      
      boolean times[] = {true, true, true, true,
                         true, true, true, true,
                         true, true, true, true};
      for (int i = 0; i < 6; i++) {
         if (start[i] > -1 && end[i] > -1) {
            for (int j = start[i] - 8; j < end[i] - 8; j++) {
               if (times[j]) {
                  times[j] = false;
               } else {
                  noOverlaps = false;
                  break;
               }
            }
         }
      }
   }

   if (!noOverlaps) {
      errors.add("startTime",
              new ActionMessage("error.rules.overlap"));
   }

   return errors;

   }

}
