package hds;

import java.util.*;
import java.text.*;

public final class HDSDate {

   private String dateString; // in MM/dd/yyyy format

   public HDSDate() {
      Date tempDate = new Date();
      try {
         SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
         sdf.setLenient(false);
         this.dateString = sdf.format(tempDate);
      } catch (Exception e){}
   }

   public HDSDate(String dateString) {
      this.dateString = dateString;
   }

   public String toString() {
      return this.dateString;
   }

   public String toMySQL() {
      String tempString = null;

      try {
         SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
         sdf.setLenient(false);
         tempString = sdf.format(toDate());
      } catch (Exception e){}

      return tempString;
   }

   // add function for including time with date

   public boolean isValidDate() {
      boolean retVal = false;

      if(toDate() != null && dateString.length() == 10)
         retVal = true;

      return retVal;
   }

   public boolean isAfter(HDSDate theDate) {
      boolean retVal = false;

      if (this.toDate().after(theDate.toDate())) {
         retVal = true;
      }

      return retVal;
   }

   public boolean isBefore(HDSDate theDate) {
      boolean retVal = false;

      if (this.toDate().before(theDate.toDate())) {
         retVal = true;
      }

      return retVal;
   }

   // Inclusive
   public boolean isBetween(HDSDate firstDate, HDSDate secondDate) {
      boolean retVal = false;

      Calendar cal = Calendar.getInstance();
      Calendar cal2 = Calendar.getInstance();
      Calendar cal3 = Calendar.getInstance();
      cal.setTime(toDate());
      cal2.setTime(firstDate.toDate());
      cal3.setTime(secondDate.toDate());
      if ((cal.after(cal2) || cal.equals(cal2)) && 
          (cal.before(cal3) || cal.equals(cal3))) {
         retVal = true;
      }

      return retVal;
   }

   public boolean isMonday() {
      boolean retVal = false;

      Calendar cal = Calendar.getInstance();
      cal.setTime(toDate());
      if (cal.get(Calendar.DAY_OF_WEEK) == 2) {
         retVal = true;
      }

      return retVal;
   }

   public boolean isFriday() {
      boolean retVal = false;

      Calendar cal = Calendar.getInstance();
      cal.setTime(toDate());
      if (cal.get(Calendar.DAY_OF_WEEK) == 6) {
         retVal = true;
      }

      return retVal;
   }

   public boolean isWeekday() {
      boolean retVal = false;

      Calendar cal = Calendar.getInstance();
      cal.setTime(toDate());
      if ((cal.get(Calendar.DAY_OF_WEEK) > 1) && 
          (cal.get(Calendar.DAY_OF_WEEK) < 7)) {
         retVal = true;
      }
      return retVal;
   }

   public Date toDate() {
      Date tempDate = null;

      try {
         SimpleDateFormat sdf = new SimpleDateFormat(".MM/dd/yyyy.");
         sdf.setLenient(false);
         tempDate = sdf.parse("." + this.dateString + ".", new ParsePosition(0));
      } catch (Exception e){
         System.err.println("Could not convert date.");
         e.printStackTrace();
      }

      return tempDate;

   }


}