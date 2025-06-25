<html>

<%
   if (request.isUserInRole("A")) {
      response.sendRedirect("admin/index.jsp");
   } else if (request.isUserInRole("L")) {
      response.sendRedirect("student/index.jsp");
   } else if (request.isUserInRole("S")) {
      response.sendRedirect("student/index.jsp");
   } else {
%>
   You have not been assigned an account type.
<%
   }
%>

</html>