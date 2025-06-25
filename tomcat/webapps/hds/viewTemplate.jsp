<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>

<html>
<head>
<title>Help Desk Scheduler</title>
<template:get name='script'/>
<!--
<link rel="stylesheet" href="css/templates.css"
      charset="ISO-8859-1" type="text/css">
-->
</head>

<template:get name='body'/>
<table border='0' width='100%'>
   <tr valign='top'>
      <td><template:get name='login'/></td>
      <td width='85%' valign='top'><center><template:get name='header'/></center></td>
   </tr>
</table>
<table>
   <tr valign='top'>
      <td><template:get name='menu'/></td>
      <td><template:get name='content'/></td>
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
