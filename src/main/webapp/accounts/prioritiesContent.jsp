<%@ page language="java" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<%
if (!(request.isUserInRole("A"))) {
   response.sendRedirect("/privileges.jsp");
}
%>

<html>
<head><title>Change Priorities</title></head>
<body>

<center><h2>Change Priorities</h2></center>

<html:errors/>

<html:form action="/changePriority.do">

<center>
<table>
   <tr>
      <td>
         <html:select property="username" size='5'>
            <html:options collection="accounts" property="username" labelProperty="fullname"/>
         </html:select>
      </td>
      <td>
         <html:select property="direction">
            <html:option value="up" key="Up"/>
            <html:option value="down" key="Down"/>
         </html:select>
      </td>
      <td>
         <html:text property="amount" size='2' maxlength='2' value="1"/>
      </td>
   </tr>
   <tr>
      <td colspan="3" align="center">
         <html:submit>Change</html:submit>
      </td>
</html:form>

</table>

<form action="/hds/index.jsp">
   <input type="submit" value ="Home">
</form>

</center>

</body>
</html>