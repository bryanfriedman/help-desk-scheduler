<%@ taglib uri='/WEB-INF/struts-template.tld' prefix='template' %>

<template:insert template='/mainTemplate.jsp'>
  <template:put name='body' content='<body>' direct='true'/>
  <template:put name='login' content='/userinfo.jsp'/>
  <template:put name='menu' content='/admin/menu.jsp'/>
  <template:put name='header' content='/header.html'/>
  <template:put name='content' content='/admin/home.jsp'/>
</template:insert>