<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<html>
<head></head>
<body>

<script>

// This script was borrowed (and tweaked) from http://power.calpoly.edu

var columnsPerRow = 8*1;  //how elements per row (columns + hidden fields)
var rowsPerColumn = 11*1; //how many rows per column

function checkThisColumn(myFlag,Column) {
   for (var i=(Column+5+columnsPerRow+1);i<document.availForm.elements.length;i+=columnsPerRow)
      document.availForm.elements[i].checked = myFlag;
}

function checkThisRow(myFlag,Row){
   var start = (Row*columnsPerRow)+columnsPerRow+6;
   var stop = start+columnsPerRow-3;
   for (var i=start;i<stop;i++)
      document.availForm.elements[i].checked = myFlag;
}

function entireForm(f,e) {
   for(var i=0; i<f.elements.length; i++) 
      f.elements[i].checked = e.checked;
}

function Mornings(myFlag) {// From 8am - 12pm
   var form = document.availForm;
   form.elements[1*columnsPerRow+5].checked = myFlag;
   form.elements[2*columnsPerRow+5].checked = myFlag;
   form.elements[3*columnsPerRow+5].checked = myFlag;
   form.elements[4*columnsPerRow+5].checked = myFlag;

   checkThisRow(myFlag,0);
   checkThisRow(myFlag,1);
   checkThisRow(myFlag,2);
   checkThisRow(myFlag,3);
}

function Afternoons(myFlag) {// From 12pm-5pm
   var form = document.availForm;
   form.elements[5*columnsPerRow+5].checked = myFlag;
   form.elements[6*columnsPerRow+5].checked = myFlag;
   form.elements[7*columnsPerRow+5].checked = myFlag;
   form.elements[8*columnsPerRow+5].checked = myFlag;
   form.elements[9*columnsPerRow+5].checked = myFlag;

   checkThisRow(myFlag,4);
   checkThisRow(myFlag,5);
   checkThisRow(myFlag,6);
   checkThisRow(myFlag,7);
   checkThisRow(myFlag,8);
}

function Evenings(myFlag) {// From 12pm-5pm
   var form = document.availForm;
   form.elements[10*columnsPerRow+5].checked = myFlag;
   form.elements[11*columnsPerRow+5].checked = myFlag;

   checkThisRow(myFlag,9);
   checkThisRow(myFlag,10);
}

function TR(myFlag) {// All day Tuesday and Thursday
   var form = document.availForm;
   form.elements[2].checked = myFlag;
   form.elements[4].checked = myFlag;
   checkThisColumn(myFlag,1);
   checkThisColumn(myFlag,3);
}

function MWF(myFlag) {// All day Monday, Wednesday, and Friday
   var form = document.availForm;
   form.elements[1].checked = myFlag;
   form.elements[3].checked = myFlag;
   form.elements[5].checked = myFlag;
   checkThisColumn(myFlag,0);
   checkThisColumn(myFlag,2);
   checkThisColumn(myFlag,4);
}

</script>


<center>
<h2>Enter By Availability</h2>
</center>

<html:errors/>

<center>

<html:form action="/setAvail.do">

These are the times that I 
<select name="when">
   <option value="amnot">am not</option>
   <option value="am">am</option>
</select>
available.
<br><br>

<table>
<tr>
   <td>&nbsp;</td>
   <td>M</td>
   <td>T</td>
   <td>W</td>
   <td>R</td>
   <td>F</td>
   <td>All</td>
</tr>
<tr>
   <td align="right">All</td>
   <td><input type="checkbox" onClick="checkThisColumn(this.checked,0)"></td>
   <td><input type="checkbox" onClick="checkThisColumn(this.checked,1)"></td>
   <td><input type="checkbox" onClick="checkThisColumn(this.checked,2)"></td>
   <td><input type="checkbox" onClick="checkThisColumn(this.checked,3)"></td>
   <td><input type="checkbox" onClick="checkThisColumn(this.checked,4)"></td>
   <td><input type="checkbox" onClick="entireForm(document.availForm,this)"></td>

   <td rowspan="12">
      <table>
      <tr>
         <td align="right">
            <b>Check off these times:</b>
         </td>
         <td>
            &nbsp;
         </td>
      </tr>
      <tr>
         <td align="right">
            Mornings (8am - 12pm) 
         </td>
         <td>
            <input type="checkbox" onClick="Mornings(this.checked)">
         </td>
      </tr>
      <tr>
         <td align="right">
            Afternoons (12pm - 5pm) 
         </td>
         <td>
            <input type="checkbox" onClick="Afternoons(this.checked)">
         </td>
      </tr>
      <tr>
         <td align="right">
            Evenings (5pm - 7pm)
         </td>
         <td>
            <input type="checkbox" onClick="Evenings(this.checked)">
         </td>
      </tr>
      <tr>
         <td align="right">
            TR (All Day on T, Th) 
         </td>
         <td>
            <input type="checkbox" onClick="TR(this.checked)">
         </td>
      </tr>
      <tr>
         <td align="right">
            MWF (All Day on M, W, F) 
         </td>
         <td>
            <input type="checkbox" onClick="MWF(this.checked)">
         </td>
      </tr>
      </table>
   </td>
</tr>

<% for (int i = 0; i < 11; i++) { %>
<tr>
<html:hidden property='<%="startTimeIndexed[" + i + "]"%>' value='<%=Integer.toString(i+8)%>'/>
<html:hidden property='<%="endTimeIndexed[" + i + "]"%>' value='<%=Integer.toString(i+9)%>'/>
   <td align="right">
      <% if (i < 4) out.println(Integer.toString(i+8) + ":00 am");
         else if (i == 4) out.println(Integer.toString(i+8) + ":00 pm");
         else out.println(Integer.toString(i+8-12) + ":00 pm");
      %>
      -
      <% if (i < 3) out.println(Integer.toString(i+9) + ":00 am");
         else if (i == 3) out.println(Integer.toString(i+9) + ":00 pm");
         else out.println(Integer.toString(i+9-12) + ":00 pm");
      %>
   </td>
<logic:iterate id="day" name="days">
   <td>
     <html:multibox property="daysOfWeek">
       <%=i%>^<bean:write name="day"/>
     </html:multibox>
   </td>
</logic:iterate>
   <td>
      <input type="checkbox" onClick='<%="checkThisRow(this.checked," + i + ")"%>'>
   </td>
</tr>
<% } %>

</table>
<br>
<html:submit>Submit</html:submit>
<html:reset>Reset</html:reset>
<html:cancel>Cancel</html:cancel>

</html:form>

</center>

</body>
</html>