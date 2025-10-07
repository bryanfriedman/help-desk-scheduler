<%@ page language="java" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html>
<head><title>

<logic:equal name="accountsForm" property="action"
            scope="request" value="modify">
Modify 
</logic:equal>
<logic:equal name="accountsForm" property="action"
            scope="request" value="create">
Create 
</logic:equal>
an Account
</title></head>
<body>

<center><h2>
<logic:equal name="accountsForm" property="action"
            scope="request" value="modify">
Modify 
</logic:equal>
<logic:equal name="accountsForm" property="action"
            scope="request" value="create">
Create 
</logic:equal>
an Account</h2></center>

<html:errors/>

<html:form action="/makeAccount.do">

<html:hidden property="action"/>

<center>
<table>

<logic:equal name="accountsForm" property="action"
            scope="request" value="modify">
<% if (request.isUserInRole("A")) { %>
   <logic:notEqual name="accountsForm" property="type"
               scope="request" value="A">
      <tr>
         <td align="right">
            Active?
         </td>
         <td align="left">
            <html:checkbox property="active"/>
         </td>
      </tr>
   </logic:notEqual>
   <logic:equal name="accountsForm" property="type"
               scope="request" value="A">
      <html:hidden name="accountsForm" property="active"/>
   </logic:equal>
<% } else { %>
   <html:hidden name="accountsForm" property="active"/>
<% } %>
   <tr>
      <td align="right">
         Account Name: 
      </td>
      <td align="left">
         <html:text property="username" readonly="true" size='8'/>
      </td>
   </tr>
</logic:equal> 
<logic:equal name="accountsForm" property="action"
            scope="request" value="create">
   <tr>
      <td align="right">
         Account Name: 
      </td>
      <td align="left">
         <html:text property="username" size='8' maxlength='8'/>
      </td>
   </tr>
</logic:equal>
   <tr>
      <td align="right">
         Full Name:
      </td>
      <td align="left">
         <html:text property="fullname"/>
      </td>
   </tr>
   <tr>
      <td align="right">
         E-Mail:
      </td>
      <td align="left">
         <html:text property="email"/>
      </td>
   </tr>
   <% if (!(request.isUserInRole("S"))) { %>
   <tr>
      <td align="right">
         Account Type:
      </td>
      <td align="left">
         <logic:notEqual name="accountsForm" property="username"
               scope="request" value="admin">
            <html:select property="type">
               <% if (request.isUserInRole("A")) { %>
               <html:option value="A">Administrator</html:option>
               <% } %>
               <html:option value="L">Lead Student</html:option>
               <html:option value="S">Student Assistant</html:option>
            </html:select>
         </logic:notEqual>
         <logic:equal name="accountsForm" property="username"
               scope="request" value="admin">
            <html:hidden name="accountsForm" property="type"/>
            <input type="text" value="Administrator" readonly="true" size='12'>
         </logic:equal>
      </td>
   </tr>
   <% } else { %>
      <html:hidden name="accountsForm" property="type" value="S"/>
   <% } %>
   <tr>
      <td align="right">
         <logic:equal name="accountsForm" property="action"
            scope="request" value="modify">
         New 
         </logic:equal>
         Password:
      </td>
      <td align="left">
         <html:password property="password" size='8' maxlength='8' value=""/>
         <input type="button" tabindex="-1" value="Random" onClick="pw()">
      </td>
   </tr>
<logic:equal name="accountsForm" property="action"
            scope="request" value="create">
   <tr>
      <td align="right">
         Work Start Date:
      </td>
      <td align="left">
         <script language="JavaScript">
         var cal = new CalendarPopup("testdiv1");
         cal.setDisabledWeekDays(0,6);
         </script>
         <html:text property="startDate" size='10' maxlength='10'/>
         <a name="calposition1" ID="calposition1"> </a>
         <input type="button" value="..." tabindex="-1"
            onClick="cal.select(document.accountsForm.startDate,'anchor1','MM/dd/yyyy'); return false;"
            name="anchor1" id="anchor1">
      </td>
   </tr>
</logic:equal>

   <tr>
      <td colspan="3" align="center">
         <logic:equal name="accountsForm" property="action"
                     scope="request" value="create">
            <html:submit>Add</html:submit>
         </logic:equal>
         <logic:equal name="accountsForm" property="action"
                     scope="request" value="modify">
            <html:submit>Change</html:submit>
         </logic:equal>             
         <html:reset>Reset</html:reset>
         <html:cancel>Cancel</html:cancel>
      </td>
   </tr>

</html:form>

</table>
</center>

<DIV ID="testdiv1" STYLE="position:absolute;visibility:hidden;">

</body>
</html>
