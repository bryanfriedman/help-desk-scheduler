<%@ page language="java" %>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<center>
<h2>Create a New Schedule</h2>
</center>

<html:errors/>

<center>

<html:form focus="name" action="/makeSchedule.do">

<table>

   <tr>
      <td align="right">
         Schedule Name:
      </td>
      <td colspan='2'>
         <html:text property="name"/>
      </td>
      <td><a href="http://www.calpoly.edu/~acadprog/acad_cal/" tabindex='-1' target="_new">View CP Schedule</a></td>
   </tr>
   <tr>
      <td align="right">
         Start Date:
      </td>   
      <td>
         <script language="JavaScript">
            var cal1 = new CalendarPopup("testdiv1");
            cal1.setDisabledWeekDays(0, 2, 3, 4, 5, 6);
         </script>
         <html:text property="startDate" size='10' maxlength='10'/>
         <a name="calposition1" ID="calposition1"> </a>
         <input type="button" value="..." tabindex="-1"
            onClick="cal1.select(document.scheduleForm.startDate,'anchor1','MM/dd/yyyy'); return false;"
            name="anchor1" id="anchor1">
      </td>
      <td>
         <font size="-1"><i>(must be Monday)</i></font>
      </td>
   </tr>
   <tr>
      <td align="right">
         End Date:
      </td>   
      <td>
         <script language="JavaScript">
            var cal2 = new CalendarPopup("testdiv1");
            cal2.setDisabledWeekDays(0, 1, 2, 3, 4, 6);
         </script>
         <html:text property="endDate" size='10' maxlength='10'/>
         <a name="calposition2" ID="calposition2"> </a>
         <input type="button" value="..." tabindex="-1"
            onClick="cal2.select(document.scheduleForm.endDate,'anchor2','MM/dd/yyyy'); return false;"
            name="anchor2" id="anchor2">
      </td>
      <td>
         <font size="-1"><i>(must be Friday)</i></font>
      </td>
   </tr>
   <tr>
      <td align="right">
         Use Default Rules?
      </td>
      <td>
         <html:checkbox property="defaultRules"/>
      </td>
      <td></td>
   </tr>
   <tr>
      <td align="right">
         Holidays (optional):
      </td>   
      <td>
         <script language="JavaScript">
            var cal3 = new CalendarPopup("testdiv1");
            cal3.setDisabledWeekDays(0, 6);
         </script>
         <html:text property="holidayIndexed[0]" size='10' maxlength='10'/>
         <input type="button" value="..." tabindex="-1"
            onClick="cal3.select(document.scheduleForm.elements[6],'anchor3','MM/dd/yyyy'); return false;"
            name="anchor3" id="anchor3">
      </td>
      <td>
         <script language="JavaScript">
            var cal4 = new CalendarPopup("testdiv1");
            cal4.setDisabledWeekDays(0, 6);
         </script>
         <html:text property="holidayIndexed[1]" size='10' maxlength='10'/>
         <input type="button" value="..." tabindex="-1"
            onClick="cal4.select(document.scheduleForm.elements[8],'anchor4','MM/dd/yyyy'); return false;"
            name="anchor4" id="anchor4">
      </td>
   </tr>
   <tr>
      <td></td>   
      <td>
         <script language="JavaScript">
            var cal5 = new CalendarPopup("testdiv1");
            cal5.setDisabledWeekDays(0, 6);
         </script>
         <html:text property="holidayIndexed[2]" size='10' maxlength='10'/>
         <input type="button" value="..." tabindex="-1"
            onClick="cal5.select(document.scheduleForm.elements[10],'anchor5','MM/dd/yyyy'); return false;"
            name="anchor5" id="anchor5">
      </td>
      <td>
         <script language="JavaScript">
            var cal6 = new CalendarPopup("testdiv1");
            cal6.setDisabledWeekDays(0, 6);
         </script>
         <html:text property="holidayIndexed[3]" size='10' maxlength='10'/>
         <input type="button" value="..." tabindex="-1"
            onClick="cal6.select(document.scheduleForm.elements[12],'anchor6','MM/dd/yyyy'); return false;"
            name="anchor6" id="anchor6">
      </td>
   </tr>
   <tr>
      <td></td>   
      <td>
         <script language="JavaScript">
            var cal7 = new CalendarPopup("testdiv1");
            cal7.setDisabledWeekDays(0, 6);
         </script>
         <html:text property="holidayIndexed[4]" size='10' maxlength='10'/>
         <input type="button" value="..." tabindex="-1"
            onClick="cal7.select(document.scheduleForm.elements[14],'anchor7','MM/dd/yyyy'); return false;"
            name="anchor7" id="anchor7">
      </td>
      <td>
         <script language="JavaScript">
            var cal8 = new CalendarPopup("testdiv1");
            cal8.setDisabledWeekDays(0, 6);
         </script>
         <html:text property="holidayIndexed[5]" size='10' maxlength='10'/>
         <input type="button" value="..." tabindex="-1"
            onClick="cal8.select(document.scheduleForm.elements[16],'anchor8','MM/dd/yyyy'); return false;"
            name="anchor8" id="anchor8">
      </td>
   </tr>
   <tr>
      <td></td>   
      <td>
         <script language="JavaScript">
            var cal9 = new CalendarPopup("testdiv1");
            cal9.setDisabledWeekDays(0, 6);
         </script>
         <html:text property="holidayIndexed[6]" size='10' maxlength='10'/>
         <input type="button" value="..." tabindex="-1"
            onClick="cal9.select(document.scheduleForm.elements[18],'anchor9','MM/dd/yyyy'); return false;"
            name="anchor9" id="anchor9">
      </td>
      <td>
         <script language="JavaScript">
            var cal0 = new CalendarPopup("testdiv1");
            cal0.setDisabledWeekDays(0, 6);
         </script>
         <html:text property="holidayIndexed[7]" size='10' maxlength='10'/>
         <input type="button" value="..." tabindex="-1"
            onClick="cal0.select(document.scheduleForm.elements[20],'anchor0','MM/dd/yyyy'); return false;"
            name="anchor0" id="anchor0">
      </td>
   </tr>
   <tr>
      <td colspan="3" align="center">
         <html:submit>Create</html:submit>
         <html:reset>Reset</html:reset>
         <html:cancel>Cancel</html:cancel>
      </td>
   </tr>

</table>

</html:form>

</center>

<DIV ID="testdiv1" STYLE="position:absolute;visibility:hidden;">