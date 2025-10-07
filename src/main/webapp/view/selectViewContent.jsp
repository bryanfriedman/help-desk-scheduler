<%@ page language="java" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<script language="JavaScript" src="CalendarPopup.js"></script>
<script language="JavaScript">document.write(CalendarPopup_getStyles());</script>

<script>
function changeType() {
   if (document.viewScheduleForm.type.selectedIndex == 0) {
      document.viewScheduleForm.way.selectedIndex = 0;
      document.viewScheduleForm.way.disabled = true;
      <% if (request.isUserInRole("A")) { %>
         document.viewScheduleForm.username.disabled = true;
      <% } %>
   } else {
      document.viewScheduleForm.way.disabled = false;
      <% if (request.isUserInRole("A")) { %>
         document.viewScheduleForm.username.disabled = false;
      <% } %>
   }
}
</script>

<script>
function populate() {
   var today = new Date();
   var day = today.getDate();
   var month = today.getMonth() + 1;
   var year = today.getYear();
   if (year < 2000) year += 1900;
   var offset = today.getDay() - 1;
   var week;

   if(offset != 0) {
      day = day - offset;
      if (day < 1) {
         if (month == 1) day = 31 + day;
         if (month == 2) day = 31 + day;
         if (month == 3) {
            if (((year % 4 == 0) &&
               (year % 100 != 0)) ||
               (year % 400 == 0)) {
               day = 29 + day;
            } else {
               day = 28 + day;
            }
         }
         if (month == 4) day = 31 + day;
         if (month == 5) day = 30 + day;
         if (month == 6) day = 31 + day;
         if (month == 7) day = 30 + day;
         if (month == 8) day = 31 + day;
         if (month == 9) day = 31 + day;
         if (month == 10) day = 30 + day;
         if (month == 11) day = 31 + day;
         if (month == 12) day = 30 + day;
         if (month == 1) {
            month = 12;
            year = year - 1;
         } else {
            month = month - 1;
         }
      }
   }
   if (month < 10) month = "0" + month;
   if (day < 10) day = "0" + day;
   week = month + "/" + day + "/" + year;
   document.viewScheduleForm.weekOfDate.value = week;

}
</script>

<center>
<h2>View a Schedule</h2>
</center>

<html:errors/>

<center>

<html:form action="/gotoView.do">

Select a schedule to view:<br>
<html:select property="scheduleId">
   <html:options collection="schedules" property="id" labelProperty="name"/>
</html:select>

<br><br>

Select the type of schedule to view:<br>
<html:select property="type" onchange="changeType();">
<html:option value="master">Master</html:option>
<html:option value="individual">Individual</html:option>
</html:select>

<br><br>

Select the way to view the schedule:<br>
<html:select property="way" disabled="true">
<html:option value="tabular">Tabular</html:option>
<html:option value="detail">Detail</html:option>
</html:select>

<% if (request.isUserInRole("A")) { %>

<br><br>

Select a user's schedule to view:<br>
<html:select property="username" disabled="true">
   <html:options collection="users" property="username" labelProperty="fullname"/>
</html:select>

<% } else { %>

<html:hidden property="username" value="<%=request.getRemoteUser()%>"/>

<% }%>

<br><br>

Select the week of:<br>
<script language="JavaScript">
         var cal = new CalendarPopup("testdiv1");
         cal.setDisabledWeekDays(0,2,3,4,5,6);
         </script>
         <html:text property="weekOfDate" size='10' maxlength='10'/>
         <a name="calposition1" ID="calposition1"> </a>
         <input type="button" value="..." tabindex="-1"
            onClick="cal.select(document.viewScheduleForm.weekOfDate,'anchor1','MM/dd/yyyy'); return false;"
            name="anchor1" id="anchor1"><br>
         <font size="-1"><i>(Must be Monday)</i></font>

<br><br>

<html:submit>View</html:submit>
<html:cancel>Cancel</html:cancel>

</html:form>

<DIV ID="testdiv1" STYLE="position:absolute;visibility:hidden;">