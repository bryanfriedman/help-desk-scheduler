<%@ page language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="hds.view.*" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<% Vector master = (Vector) session.getAttribute("master"); %>
<% Vector times = (Vector) session.getAttribute("times"); %>
<% 
   String[] days = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday"};
   ViewScheduleForm schedBean = 
         (ViewScheduleForm) session.getAttribute("viewScheduleForm");
%>

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

<table border='1' width="100%">

   <tr>

      <td bgcolor="black" align='center'></td>

      <% for (int i = 0; i < 5; i++) { %>
         <td bgcolor="#F5F5F5" width="20%" align='center'>
            <font size='2'><%=days[i]%> <%=schedBean.getDateIndexedNoYear(i)%></font>
         </td>
      <% } %>

   </tr>

   <tr>

      <td nowrap valign="top">
         <table border='0' cellspacing='2' cellpadding='4'>
            <tr><td bgcolor="darkgray" nowrap align='right'><font size='2'>8:00 am</font></td></tr>
            <tr><td bgcolor="white" nowrap align='right'><font size='2'>9:00 am</font></td></tr>
            <tr><td bgcolor="darkgray" nowrap align='right'><font size='2'>10:00 am</font></td></tr>
            <tr><td bgcolor="white" nowrap align='right'><font size='2'>11:00 am</font></td></tr>
            <tr><td bgcolor="darkgray" nowrap align='right'><font size='2'>12:00 pm</font></td></tr>
            <tr><td bgcolor="white" nowrap align='right'><font size='2'>1:00 pm</font></td></tr>
            <tr><td bgcolor="darkgray" nowrap align='right'><font size='2'>2:00 pm</font></td></tr>
            <tr><td bgcolor="white" nowrap align='right'><font size='2'>3:00 pm</font></td></tr>
            <tr><td bgcolor="darkgray" nowrap align='right'><font size='2'>4:00 pm</font></td></tr>
            <tr><td bgcolor="white" nowrap align='right'><font size='2'>5:00 pm</font></td></tr>
            <tr><td bgcolor="darkgray" nowrap align='right'><font size='2'>6:00 pm</font></td></tr>
         </table>
      </td>

      <% for (int k = 0; k < 5; k++) { %>
         <% Vector entries = (Vector) master.get(k); %>
         <td nowrap valign="top"> 
            <table width='100%' border='0' cellspacing='2' cellpadding='4'>
            <% for (int j = 0; j < 11; j++) { %>
               <tr> 
               <td><font size='2'>&nbsp;</font></td>
               <% for (int i = 0; i < entries.size(); i++) { 
                     ScheduleViewForm f = (ScheduleViewForm) entries.get(i); 
                     String time = (String) times.get(j);
                     if (time.equals(f.getStartTime())) {
               %>
                  <% if (Integer.parseInt(f.getShiftLength()) < 3) { %> 
                     <td nowrap bgcolor='#C0C0C0' align='center' rowspan='<%=f.getShiftLength()%>'>
                  <% } else { %>
                     <td bgcolor='#C0C0C0' align='center' rowspan='<%=f.getShiftLength()%>'>
                  <% } %>
                        <font size='1'>
                           <logic:notEqual name="viewScheduleForm" property="type" value="master">
                              <%=f.getName()%>
                           </logic:notEqual>
                           <logic:equal name="viewScheduleForm" property="type" value="master">
                              <%=f.getName().substring(0,4)%> <%-- Nickname --%>
                           </logic:equal>
                           <% if (Integer.parseInt(f.getShiftLength()) > 1) { %> 
                           <br>
                           <%=f.getStart()%>-<%=f.getEnd()%>
                           <% } %>                           
                        </font>
                     </td>
               <%    } 
                  } 
               %>
               <td><font size='2'>&nbsp;</font></td>
               </tr>
            <% } %>
            </table>
         </td>
      <% } %>

   </tr>

</table>

<br>

<input type='button' value="Print" onClick='window.print()'>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type='button' value="Cancel" onClick='window.close()'>

</center>