<%@ page language="java" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html>
<head><title>Accounts Page</title></head>
<script>
function confirmDelete() {
   if (confirm("Are you sure you want to delete this account?")) {
      return true;
   } else {
      return false;
   }
} 
</script>
<body>

<center><h2>Accounts</h2></center>

<table border="1" width="100%">

  <tr>
    <th align="center">
      <html:link page="/mainAccounts.do?sort=a">Account Name</html:link>
    </th>
    <th align="center">
      Full Name
    </th>
    <th align="center">
      E-Mail
    </th>
    <th align="center">
            <html:link page="/mainAccounts.do?sort=t">Type</html:link>
    </th>
    <th align="center">
      <html:link page="/mainAccounts.do?sort=p">Priority</html:link>
    </th>
    <th align="center">
      Start Date
    </th>
    <th align="center">
      Modify?
    </th>
<% if (request.isUserInRole("A")) { %>
    <th align="center">
      Delete?
    </th>
<% } %>
  </tr>

<logic:iterate id="account" name="accounts">
   <logic:equal name="account" property="active" value="true">
      <tr>
   </logic:equal>
   <logic:equal name="account" property="active" value="false">
      <tr style="color:gray">
   </logic:equal>   
     <td align="left">
       <bean:write name="account" property="username" filter="true"/>
     </td>
     <td align="left">
       <bean:write name="account" property="fullname" filter="true"/>
     </td>
     <td align="left">
       <bean:write name="account" property="email" filter="true"/>
     </td>
     <td align="center">
       <bean:write name="account" property="type" filter="true"/>
     </td>
      <td align="center">
      <bean:write name="account" property="priority" filter="true"/>
      </td>
      <td align="center">
        <bean:write name="account" property="startDate" filter="true"/>
       </td>
      
      <html:form action="/editAccount.do?action=modify">
      <td align="center">
            <html:hidden name="account" property="username"/>
            <html:submit>Modify</html:submit>
      </td>
      </html:form>
<% if (request.isUserInRole("A")) { %>
      <html:form action="/deleteAccount.do" onsubmit="return confirmDelete();">
      <td align="center">
            <logic:notEqual name="account" property="username" value="admin">
               <html:hidden name="account" property="username"/>
               <html:hidden name="account" property="type"/>
               <html:hidden name="account" property="email"/>
               <html:submit>Delete</html:submit>
            </logic:notEqual>
      </td>
      </html:form>
<% } %>
   </tr>
</logic:iterate>

</table>
<br>
<center>
<table border='0'>
   <tr>
      <html:form action="/editAccount.do?action=create">
      <td>
         <html:submit>Add Account</html:submit>
      </td>
      </html:form>
<% if (request.isUserInRole("A")) { %>
      <html:form action="/priorities.do">
      <td>
         <html:submit>Set Priorities</html:submit>
      </td>
      </html:form>
<% } %>
      <form action="/hds/index.jsp">
      <td>
         <input type="submit" value ="Home">
      </td>
      </form>
   </tr>
</table>
</center>

</body>
</html>