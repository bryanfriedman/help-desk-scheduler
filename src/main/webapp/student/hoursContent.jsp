<%@ page language="java" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html>
<head></head>
<body>

<center>
<h2>Preferred Hours</h2>
</center>

<html:errors/>

<center>

If I were creating my schedule, these would be my hours:

<html:form action="/setPrefHours.do">

<table>
<tr>
   <td align="center"><b>Days</b></td>
   <td align="center"><b>Start Time</b></td>
   <td align="center"><b>End Time</b></td>
</tr>
<% for (int i = 0; i < 8; i++) { %>
<tr>
   <td>
      <table cellpadding="0" cellspacing="0">
         <tr>
            <td align="center"><font size="-1">M</font></td>
            <td align="center"><font size="-1">T</font></td>
            <td align="center"><font size="-1">W</font></td>
            <td align="center"><font size="-1">R</font></td>
            <td align="center"><font size="-1">F</font></td>
         </tr>
         <tr>
         <logic:iterate id="day" name="days">
            <td>
              <html:multibox property="daysOfWeek">
                <%=i%>^<bean:write name="day"/>
              </html:multibox>
            </td>
         </logic:iterate>
         </tr>
      </table>
   </td>
   <td>
      <html:select property='<%="startTimeIndexed[" + i + "]"%>'>
         <html:option value=""></html:option>
         <html:option value="8">8:00 AM</html:option>
         <html:option value="9">9:00 AM</html:option>
         <html:option value="10">10:00 AM</html:option>
         <html:option value="11">11:00 AM</html:option>
         <html:option value="12">12:00 PM</html:option>
         <html:option value="13">1:00 PM</html:option>
         <html:option value="14">2:00 PM</html:option>
         <html:option value="15">3:00 PM</html:option>
         <html:option value="16">4:00 PM</html:option>
         <html:option value="17">5:00 PM</html:option>
         <html:option value="18">6:00 PM</html:option>
      </html:select>
   </td>
   <td>
      <html:select property='<%="endTimeIndexed[" + i + "]"%>'>
         <html:option value=""></html:option>
         <html:option value="9">9:00 AM</html:option>
         <html:option value="10">10:00 AM</html:option>
         <html:option value="11">11:00 AM</html:option>
         <html:option value="12">12:00 PM</html:option>
         <html:option value="13">1:00 PM</html:option>
         <html:option value="14">2:00 PM</html:option>
         <html:option value="15">3:00 PM</html:option>
         <html:option value="16">4:00 PM</html:option>
         <html:option value="17">5:00 PM</html:option>
         <html:option value="18">6:00 PM</html:option>
         <html:option value="19">7:00 PM</html:option>
      </html:select>
   </td>
</tr>
<% } %>

</table>
<br>
<html:submit>Submit</html:submit>
<html:reset>Reset</html:reset>
<html:cancel>Cancel</html:cancel>

</html:form>

</center>

</body>
</html>