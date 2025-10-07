<%@ page language="java" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<center>

<h2>Tabular Week View</h2>

<bean:write name="viewScheduleForm" property="scheduleName"/> 
<logic:equal name="viewScheduleForm" property="type" value="master">
Master 
</logic:equal>
Schedule 
<logic:equal name="viewScheduleForm" property="type" value="individual">
for <bean:write name="viewScheduleForm" property="fullname"/> 
</logic:equal>
<br>
<bean:write name="viewScheduleForm" property="dateIndexed[0]"/> -
<bean:write name="viewScheduleForm" property="dateIndexed[4]"/>

<br><br>

</center>
