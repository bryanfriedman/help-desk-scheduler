package hds;

import jakarta.servlet.http.*;
import java.lang.*;
import java.util.*;
import org.apache.struts.action.*;

public final class PrefHoursForm extends ActionForm {

   private String[] startTime = {"", "", "", "", 
                                 "", "", "", ""};
   public String getStartTimeIndexed(int index) {
      return (this.startTime[index]);
   }
   public void setStartTimeIndexed(int index, String startTime) {
      this.startTime[index] = startTime;
   }

   private String[] endTime = {"", "", "", "", 
                               "", "", "", ""};
   public String getEndTimeIndexed(int index) {
      return (this.endTime[index]);
   }
   public void setEndTimeIndexed(int index, String endTime) {
      this.endTime[index] = endTime;
   }

   private String[] daysOfWeek = {};
   public String[] getDaysOfWeek() { 
     return (this.daysOfWeek); 
   } 
   public void setDaysOfWeek(String[] daysOfWeek) { 
     this.daysOfWeek = daysOfWeek; 
   }


   void reset() {
      
   }


   public ActionErrors validate(ActionMapping mapping,
                           HttpServletRequest request) {
   
   ActionErrors errors = new ActionErrors();

   
      for (int i = 0; i < 6; i++) {

         String num = Integer.toString(i);
         List listOfDays = Arrays.asList(daysOfWeek);
         String daysi = "";

         String[] daysNames = {"M", "T", "W", "R", "F"};
         int idx = -1;
         for (int a = 0; a < 5; a++) {
            idx = listOfDays.indexOf(num + "^" + daysNames[a]);
            if (idx >= 0) {
               daysi += listOfDays.toArray()[idx];
            }
         }

         String rowi = startTime[i] + endTime[i] + daysi;
         if (("".equals(startTime[i]) || 
              "".equals(endTime[i]) || 
              "".equals(daysi)) && 
             (!("".equals(rowi)))) {

            errors.add("startTime",
                    new ActionMessage("error.rules.fullrow"));

         } else if (!("".equals(rowi))) {

            int start = Integer.parseInt(startTime[i]);
            int end = Integer.parseInt(endTime[i]);

            if (start >= end) {
               errors.add("startTime", new ActionMessage("error.rules.before"));
            }
         }
      }

   return errors;

   }

}






