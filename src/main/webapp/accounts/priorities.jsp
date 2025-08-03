<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>

<%
if (!(request.isUserInRole("A"))) {
   response.sendRedirect("/privileges.jsp");
}
%>

<template:insert template='/mainTemplate.jsp'>
  <template:put name='body' content='<body>' direct='true'/>
  <template:put name='login' content='/userinfo.jsp'/>
  <template:put name='menu' content='/admin/menu.jsp'/>
  <template:put name='header' content='/header.html'/>
  <template:put name='content' content='/accounts/prioritiesContent.jsp'/>
</template:insert>