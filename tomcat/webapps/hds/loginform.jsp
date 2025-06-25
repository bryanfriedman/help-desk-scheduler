<form name='loginform' method='POST' action="<%= response.encodeURL("/hds/j_security_check") %>">

   <table>
      <tr>
         <td><font size='2'>Username:</font></td>
         <td><input type='text' name="j_username" size='8' maxlength='8'></td>
      </tr>
      <tr>
         <td><font size='2'>Password:</font></td>
         <td><input type='password' name="j_password" size='8' maxlength='8'></td>
      </tr>
      <tr>
         <td colspan='2'><center><input type="submit" value="Login"></center></td>
      </tr>
   </table>

</html:form>