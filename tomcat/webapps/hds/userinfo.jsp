<% 
String name = request.getRemoteUser();
String role;
if (request.isUserInRole("A")) {
   role = "n Administrator";
} else if (request.isUserInRole("L")) {
   role = " Lead";
} else if (request.isUserInRole("S")) {
   role = " Student";
} else {
   role = null;
}
%>

<font size='2'>
Welcome, <%=name%>!<br>
You're a<%=role%>.<br>
Today is 
<script>
var d = new Date();
var m = d.getMonth() + 1;
document.write(" " + m + "/");
document.write(d.getDate() + "/");
document.write(d.getFullYear());
</script>.
<br>
<a href="/hds/logout.jsp">Logout</a>
