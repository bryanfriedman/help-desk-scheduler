<%@ page language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="hds.view.*" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<% Vector master = (Vector) session.getAttribute("master"); %>
<% 
   String[] days = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday"};
   ViewScheduleForm schedBean = 
         (ViewScheduleForm) session.getAttribute("viewScheduleForm");
%>

<center>

<h2>Individual Detail View</h2>

<bean:write name="viewScheduleForm" property="scheduleName"/> 
Schedule for<br>
<b><bean:write name="viewScheduleForm" property="fullname"/></b><br>
for the<br>
<b>week of <bean:write name="viewScheduleForm" property="dateIndexed[0]"/></b>

<br><br>

<table border='0'>

         <% for (int k = 0; k < 5; k++) { %>
            <tr>
            <td><%=days[k]%></td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td>

         <% Vector entries = (Vector) master.get(k); %>
               <% if (entries.size() < 1) { %>
                  None
               <% } %>

               <% for (int i = 0; i < entries.size(); i++) { %>
                  <% ScheduleViewForm f = (ScheduleViewForm) entries.get(i); %>
                  <%=f.getStart()%>:00
                  <% if ((Integer.parseInt(f.getStart()) > 7) &&
                         (Integer.parseInt(f.getStart()) != 12)) { %>
                     am
                  <% } else { %>
                     pm
                  <% } %>
                     -
                  <%=f.getEnd()%>:00
                  <% if ((Integer.parseInt(f.getEnd()) > 7) &&
                         (Integer.parseInt(f.getEnd()) != 12)) { %>
                     am
                  <% } else { %>
                     pm
                  <% } %>
                  <br>
               <% } %>              
               
            </td> 
            <tr><td>&nbsp;</td></tr>
         <% } %>




   </tr>

</table>

<br>

<input type='button' value="Print" onClick='window.print()'>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type='button' value="Cancel" onClick='window.close()'>

</center>