<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<script>
function pw() {
   var chars = new Array('A', 'B', 'C', 'D', 'E', 'F',
                         'G', 'H', 'I', 'J', 'K', 'L',
                         'M', 'N', 'O', 'P', 'Q', 'R',
                         'S', 'T', 'U', 'V', 'W', 'X',
                         'Y', 'Z', 'a', 'b', 'c', 'd', 
                         'e', 'f', 'g', 'h', 'i', 'j', 
                         'k', 'l', 'm', 'n', 'o', 'p', 
                         'q', 'r', 's', 't', 'u', 'v', 
                         'w', 'x', 'y', 'z', '0', '1',
                         '2', '3', '4', '5', '6', '7',
                         '8', '9');
   var newPassword = "";
   for (i=0; i<8; i++) {
     newPassword = newPassword + chars[(Math.round(Math.random()*62))];
   }

   document.accountsForm.password.value=newPassword;
}
</script>
<script language="JavaScript" src="CalendarPopup.js"></script>
<script language="JavaScript">document.write(CalendarPopup_getStyles());</script>
<script>
function uf() {
<logic:equal name="accountsForm" property="action"
            scope="request" value="modify">
document.accountsForm.fullname.focus();
</logic:equal>
<logic:equal name="accountsForm" property="action"
            scope="request" value="create">
document.accountsForm.username.focus();
</logic:equal>
}
</script>


