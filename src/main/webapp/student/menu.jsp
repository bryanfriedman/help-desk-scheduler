<%@ page language="java" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<center>

<br>

<% if (request.isUserInRole("L")) { %>
<form action="<%= response.encodeURL("/hds/mainAccounts.do") %>">
<% } else if (request.isUserInRole("S")) { %>
<form action="<%= response.encodeURL("/hds/editAccount.do") %>">
   <input type="hidden" name="action" value="modify">
   <input type="hidden" name="username" value="<%=request.getRemoteUser()%>">
<% } %>
<input type="submit" value="Accounts">
</form>


<form action="<%= response.encodeURL("/hds/enterPrefs.do") %>">
<input type="submit" value="Set Prefs">
</form>

<form action="<%= response.encodeURL("/hds/viewSchedule.do") %>">
<input type="submit" value="View/Print">
</form>


</center>