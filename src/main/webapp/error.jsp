<%@ taglib uri='http://struts.apache.org/tags-tiles' 
	 	  prefix='tiles' %>

<tiles:insert page='/mainTemplate.jsp'>
  <tiles:put name='script' value='<script>function lf()
      {document.loginform.j_username.focus();}</script>' direct='true'/>
  <tiles:put name='body' value='<body onLoad=lf()>' direct='true'/>
  <tiles:put name='login' value='/loginError.jsp'/>
  <tiles:put name='header' value='/header.html'/>
  <tiles:put name='content' value='/home.jsp'/>
</tiles:insert>
