<%
session.invalidate();
String msg = (String) request.getAttribute("exception");
%>
<html>
<head><title>Problem</title></head>
<body>

<h2>Problem</h2>

<p>There was a problem performing the requested action:</p>
<pre><%=msg%></pre>
<p>You have been logged out of the system.</p>

</body>
</html>
