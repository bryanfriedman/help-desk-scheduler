<%@ taglib uri='/WEB-INF/struts-template.tld' 
	 	  prefix='template' %>

<template:insert template='/mainTemplate.jsp'>
  <template:put name='script' content='<script>function lf()
      {document.loginform.j_username.focus();}</script>' direct='true'/>
  <template:put name='body' content='<body onLoad=lf()>' direct='true'/>
  <template:put name='login' content='/loginError.jsp'/>
  <template:put name='header' content='/header.html'/>
  <template:put name='content' content='/home.jsp'/>
</template:insert>
