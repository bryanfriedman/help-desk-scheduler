<%@ page language="java" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri='http://struts.apache.org/tags-tiles' prefix='tiles' %>

<html>
<head>
<title>Help Desk Scheduler</title>
<tiles:insert ignore="true" attribute='script'/>
<!--
<link rel="stylesheet" href="css/templates.css"
      charset="ISO-8859-1" type="text/css">
-->
</head>

<tiles:insert ignore="true" attribute='body'/>
<table border='0' width='100%'>
   <tr valign='top'>
      <td><tiles:insert ignore="true" attribute='login'/></td>
      <td width='85%' valign='top'><center><tiles:insert ignore="true" attribute='header'/></center></td>
   </tr>
   <tr valign='top'>
      <td><tiles:insert ignore="true" attribute='menu'/></td>
      <td><tiles:insert ignore="true" attribute='content'/></td>
   </tr> 
</table>
</body>
</html>

<%
/* 
Display a "login" space in the upper left of the page.
Display a "header" over the right column.
Display a "menu" below the login space.
Display the page "content" below the header.
If we change the layout of the elements on this page, all pages 
inserting this page will also change to use the new layout.
*/
%>
