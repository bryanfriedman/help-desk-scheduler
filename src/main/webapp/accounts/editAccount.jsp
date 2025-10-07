<%@ taglib uri='http://struts.apache.org/tags-tiles' prefix='tiles' %>

<tiles:insert page='/mainTemplate.jsp'>
  <tiles:put name='body' value='<body onLoad="uf()">' direct='true'/>
  <tiles:put name='script' value='/accounts/accountsScript.jsp'/>
  <tiles:put name='login' value='/userinfo.jsp'/>
<% if (request.isUserInRole("A")) { %>
   <tiles:put name='menu' value='/admin/menu.jsp'/>
<% } else if (request.isUserInRole("S")) { %>
   <tiles:put name='menu' value='/student/menu.jsp'/>
<% } else if (request.isUserInRole("L")) { %>
   <tiles:put name='menu' value='/student/menu.jsp'/>
<% } %>
  <tiles:put name='header' value='/header.html'/>
  <tiles:put name='content' value='/accounts/editAccountContent.jsp'/>
</tiles:insert>