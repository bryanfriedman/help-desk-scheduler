package hds.view;

import javax.servlet.http.*;
import java.lang.*;
import org.apache.struts.action.*;

public final class ScheduleViewForm extends ActionForm {

   /* Day of Week */
   private String dayOfWeek = null;
   public String getDayOfWeek() {
      return (this.dayOfWeek);
   }
   public void setDayOfWeek(String dayOfWeek) {
      this.dayOfWeek = dayOfWeek;
   }

   /* Week Number */
   private int weekNumber = 0;
   public int getWeekNumber() {
      return (this.weekNumber);
   }
   public void setWeekNumber(int weekNumber) {
      this.weekNumber = weekNumber;
   }

   /* Schedule ID*/
   private int scheduleId = 0;
   public int getScheduleId() {
      return (this.scheduleId);
   }
   public void setScheduleId(int scheduleId) {
      this.scheduleId = scheduleId;
   }

   /* Name */
   private String name = null;
   public String getName() {
      return (this.name);
   }
   public void setName(String name) {
      this.name = name;
   }

   /* Start Time 'HH:MM:SS' */
   private String startTime = null;
   public String getStartTime() {
      return (this.startTime);
   }
   public void setStartTime(String startTime) {
      this.startTime = startTime;
   }

   /* End Time 'HH:MM:SS' */
   private String endTime = null;
   public String getEndTime() {
      return (this.endTime);
   }
   public void setEndTime(String endTime) {
      this.endTime = endTime;
   }

   /* Start 'H' */
   private String start = null;
   public String getStart() {
      return (this.start);
   }
   public void setStart(String start) {
      this.start = start;
   }

   /* End 'H' */
   private String end = null;
   public String getEnd() {
      return (this.end);
   }
   public void setEnd(String end) {
      this.end = end;
   }

   /* Shift Length */
   private String shiftLength = null;
   public String getShiftLength() {
      return (this.shiftLength);
   }
   public void setShiftLength(String shiftLength) {
      this.shiftLength = shiftLength;
   }

   void reset() {
   }

   public ActionErrors validate(ActionMapping mapping,
                        HttpServletRequest request) {

      ActionErrors errors = new ActionErrors();

      return errors;
   }
}
