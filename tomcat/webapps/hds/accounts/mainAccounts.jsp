<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>

<template:insert template='/mainTemplate.jsp'>
  <template:put name='body' content='<body>' direct='true'/>
  <template:put name='login' content='/userinfo.jsp'/>
<% if (request.isUserInRole("A")) { %>
   <template:put name='menu' content='/admin/menu.jsp'/>
<% } else if (request.isUserInRole("S")) { %>
   <template:put name='menu' content='/student/menu.jsp'/>
<% } else if (request.isUserInRole("L")) { %>
   <template:put name='menu' content='/student/menu.jsp'/>
<% } %>
  <template:put name='header' content='/header.html'/>
  <template:put name='content' content='/accounts/accountsFront.jsp'/>
</template:insert>