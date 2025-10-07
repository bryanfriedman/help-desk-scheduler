<%@ page language="java" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<center>
<h2>Enter Schedule Preferences</h2>
</center>

<html:errors/>

<center>

<html:form action="setPrefs.do">

Enter preferences for which schedule?<br>

<html:select property="scheduleId">
   <html:options collection="schedules" property="id" labelProperty="name"/>
</html:select>

<br><br>

I would like to work approximately <br>
<html:text property="minHours" size="2" maxlength="2"/>
to
<html:text property="maxHours" size="2" maxlength="2"/> <br>
hours per week.

<br><br>

Enter preferences by:<br>
<select name="enterBy">
   <option value="avail">Availability</option>
   <option value="class">Class Schedule</option>
</select>

<br><br>

<html:submit>Submit</html:submit>
<html:reset>Reset</html:reset>
<html:cancel>Cancel</html:cancel>

</html:form>