<%@ taglib uri='http://struts.apache.org/tags-tiles' prefix='tiles' %>

<tiles:insert page='/mainTemplate.jsp'>
  <tiles:put name='body' value='<body>' direct='true'/>
  <tiles:put name='login' value='/userinfo.jsp'/>
  <tiles:put name='menu' value='/student/menu.jsp'/>
  <tiles:put name='header' value='/header.html'/>
  <tiles:put name='content' value='/student/noSchedsContent.jsp'/>
</tiles:insert>