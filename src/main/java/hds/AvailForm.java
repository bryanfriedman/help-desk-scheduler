package hds;

import jakarta.servlet.http.*;
import java.lang.*;
import org.apache.struts.action.*;

public final class AvailForm extends ActionForm {

   private String[] startTime = {null, null, null, null, 
                                 null, null, null, null,
                                 null, null, null};
   public String getStartTimeIndexed(int index) {
      return (this.startTime[index]);
   }
   public void setStartTimeIndexed(int index, String startTime) {
      this.startTime[index] = startTime;
   }

   private String[] endTime = {null, null, null, null, 
                               null, null, null, null,
                               null, null, null};
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

   return errors;

   }

}




