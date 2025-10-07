<%@ page language="java" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<center>

<br>

<form action="<%= response.encodeURL("/hds/mainAccounts.do") %>">
<input type="hidden" name="sort" value="t">
<input type="submit" value="Accounts">
</form>

<p>

<html:form action="/priorities.do">
<html:submit>Priorities</html:submit>
</html:form>

<form action="<%= response.encodeURL("/hds/newSchedule.do") %>">
<input type="submit" value="New Schedule">
</form>

<form action="<%= response.encodeURL("/hds/rules.do") %>">
<input type="hidden" name="default" value="true">
<input type="submit" value="Default Rules">
</form>

<form action="<%= response.encodeURL("/hds/viewSchedule.do") %>">
<input type="submit" value="View/Print">
</form>

</center>