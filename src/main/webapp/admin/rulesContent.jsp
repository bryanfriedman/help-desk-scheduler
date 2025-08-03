<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<center>
<h2>Set Rules</h2>
</center>

<html:errors/>

<center>

<html:form action="/setRules.do">

<table>

<tr>
      <td>
         &nbsp;
      </td>
      <td>
         start time
      </td>
      <td>
         &nbsp;
      </td>
      <td>
         end time
      </td>
      <td>
         &nbsp;
      </td>
      <td>
         min #
      </td>
      <td>
         &nbsp;
      </td>
      <td>
         max #
      </td>
      <td>
         &nbsp;
      </td>
      <td>
         Lead
      </td>
      <td>
         /
      </td>
      <td>
         Student ratio
      </td>   
   </tr>

   <tr>
      <td>
         From
      </td>
      <td>
         <html:select name="rulesForm" property="startTimeIndexed[0]">
            <html:option value=""></html:option>
            <html:option value="8">8:00 AM</html:option>
            <html:option value="9">9:00 AM</html:option>
            <html:option value="10">10:00 AM</html:option>
            <html:option value="11">11:00 AM</html:option>
            <html:option value="12">12:00 PM</html:option>
            <html:option value="13">1:00 PM</html:option>
            <html:option value="14">2:00 PM</html:option>
            <html:option value="15">3:00 PM</html:option>
            <html:option value="16">4:00 PM</html:option>
            <html:option value="17">5:00 PM</html:option>
            <html:option value="18">6:00 PM</html:option>
         </html:select>
      </td>
      <td>
         to
      </td>
      <td>
         <html:select name="rulesForm" property="endTimeIndexed[0]">
            <html:option value=""></html:option>
            <html:option value="9">9:00 AM</html:option>
            <html:option value="10">10:00 AM</html:option>
            <html:option value="11">11:00 AM</html:option>
            <html:option value="12">12:00 PM</html:option>
            <html:option value="13">1:00 PM</html:option>
            <html:option value="14">2:00 PM</html:option>
            <html:option value="15">3:00 PM</html:option>
            <html:option value="16">4:00 PM</html:option>
            <html:option value="17">5:00 PM</html:option>
            <html:option value="18">6:00 PM</html:option>
            <html:option value="19">7:00 PM</html:option>
         </html:select>
      </td>
      <td>
         :
      </td>
      <td>
         <html:text name="rulesForm" property="minIndexed[0]" size="2" maxlength="2"/>
      </td>
      <td>
         &nbsp;
      </td>
      <td>
         <html:text name="rulesForm" property="maxIndexed[0]" size="2" maxlength="2"/>
      </td>
      <td>
         &nbsp;
      </td>
      <td>
         <html:text name="rulesForm" property="leadIndexed[0]" size="2" maxlength="2"/>
      </td>
      <td>
         /
      </td>
      <td>
         <html:text name="rulesForm" property="studentIndexed[0]" size="2" maxlength="2"/>
      </td>   
   </tr>

<tr>
      <td>
         From
      </td>
      <td>
         <html:select name="rulesForm" property="startTimeIndexed[1]">
            <html:option value=""></html:option>
            <html:option value="8">8:00 AM</html:option>
            <html:option value="9">9:00 AM</html:option>
            <html:option value="10">10:00 AM</html:option>
            <html:option value="11">11:00 AM</html:option>
            <html:option value="12">12:00 PM</html:option>
            <html:option value="13">1:00 PM</html:option>
            <html:option value="14">2:00 PM</html:option>
            <html:option value="15">3:00 PM</html:option>
            <html:option value="16">4:00 PM</html:option>
            <html:option value="17">5:00 PM</html:option>
            <html:option value="18">6:00 PM</html:option>
         </html:select>
      </td>
      <td>
         to
      </td>
      <td>
         <html:select name="rulesForm" property="endTimeIndexed[1]">
            <html:option value=""></html:option>
            <html:option value="9">9:00 AM</html:option>
            <html:option value="10">10:00 AM</html:option>
            <html:option value="11">11:00 AM</html:option>
            <html:option value="12">12:00 PM</html:option>
            <html:option value="13">1:00 PM</html:option>
            <html:option value="14">2:00 PM</html:option>
            <html:option value="15">3:00 PM</html:option>
            <html:option value="16">4:00 PM</html:option>
            <html:option value="17">5:00 PM</html:option>
            <html:option value="18">6:00 PM</html:option>
            <html:option value="19">7:00 PM</html:option>
         </html:select>
      </td>
      <td>
         :
      </td>
      <td>
         <html:text name="rulesForm" property="minIndexed[1]" size="2" maxlength="2"/>
      </td>
      <td>
         &nbsp;
      </td>
      <td>
         <html:text name="rulesForm" property="maxIndexed[1]" size="2" maxlength="2"/>
      </td>
      <td>
         &nbsp;
      </td>
      <td>
         <html:text name="rulesForm" property="leadIndexed[1]" size="2" maxlength="2"/>
      </td>
      <td>
         /
      </td>
      <td>
         <html:text name="rulesForm" property="studentIndexed[1]" size="2" maxlength="2"/>
      </td>   
   </tr>

<tr>
      <td>
         From
      </td>
      <td>
         <html:select name="rulesForm" property="startTimeIndexed[2]">
            <html:option value=""></html:option>
            <html:option value="8">8:00 AM</html:option>
            <html:option value="9">9:00 AM</html:option>
            <html:option value="10">10:00 AM</html:option>
            <html:option value="11">11:00 AM</html:option>
            <html:option value="12">12:00 PM</html:option>
            <html:option value="13">1:00 PM</html:option>
            <html:option value="14">2:00 PM</html:option>
            <html:option value="15">3:00 PM</html:option>
            <html:option value="16">4:00 PM</html:option>
            <html:option value="17">5:00 PM</html:option>
            <html:option value="18">6:00 PM</html:option>
         </html:select>
      </td>
      <td>
         to
      </td>
      <td>
         <html:select name="rulesForm" property="endTimeIndexed[2]">
            <html:option value=""></html:option>
            <html:option value="9">9:00 AM</html:option>
            <html:option value="10">10:00 AM</html:option>
            <html:option value="11">11:00 AM</html:option>
            <html:option value="12">12:00 PM</html:option>
            <html:option value="13">1:00 PM</html:option>
            <html:option value="14">2:00 PM</html:option>
            <html:option value="15">3:00 PM</html:option>
            <html:option value="16">4:00 PM</html:option>
            <html:option value="17">5:00 PM</html:option>
            <html:option value="18">6:00 PM</html:option>
            <html:option value="19">7:00 PM</html:option>
         </html:select>
      </td>
      <td>
         :
      </td>
      <td>
         <html:text name="rulesForm" property="minIndexed[2]" size="2" maxlength="2"/>
      </td>
      <td>
         &nbsp;
      </td>
      <td>
         <html:text name="rulesForm" property="maxIndexed[2]" size="2" maxlength="2"/>
      </td>
      <td>
         &nbsp;
      </td>
      <td>
         <html:text name="rulesForm" property="leadIndexed[2]" size="2" maxlength="2"/>
      </td>
      <td>
         /
      </td>
      <td>
         <html:text name="rulesForm" property="studentIndexed[2]" size="2" maxlength="2"/>
      </td>   
   </tr>

<tr>
      <td>
         From
      </td>
      <td>
         <html:select name="rulesForm" property="startTimeIndexed[3]">
            <html:option value=""></html:option>
            <html:option value="8">8:00 AM</html:option>
            <html:option value="9">9:00 AM</html:option>
            <html:option value="10">10:00 AM</html:option>
            <html:option value="11">11:00 AM</html:option>
            <html:option value="12">12:00 PM</html:option>
            <html:option value="13">1:00 PM</html:option>
            <html:option value="14">2:00 PM</html:option>
            <html:option value="15">3:00 PM</html:option>
            <html:option value="16">4:00 PM</html:option>
            <html:option value="17">5:00 PM</html:option>
            <html:option value="18">6:00 PM</html:option>
         </html:select>
      </td>
      <td>
         to
      </td>
      <td>
         <html:select name="rulesForm" property="endTimeIndexed[3]">
            <html:option value=""></html:option>
            <html:option value="9">9:00 AM</html:option>
            <html:option value="10">10:00 AM</html:option>
            <html:option value="11">11:00 AM</html:option>
            <html:option value="12">12:00 PM</html:option>
            <html:option value="13">1:00 PM</html:option>
            <html:option value="14">2:00 PM</html:option>
            <html:option value="15">3:00 PM</html:option>
            <html:option value="16">4:00 PM</html:option>
            <html:option value="17">5:00 PM</html:option>
            <html:option value="18">6:00 PM</html:option>
            <html:option value="19">7:00 PM</html:option>
         </html:select>
      </td>
      <td>
         :
      </td>
      <td>
         <html:text name="rulesForm" property="minIndexed[3]" size="2" maxlength="2"/>
      </td>
      <td>
         &nbsp;
      </td>
      <td>
         <html:text name="rulesForm" property="maxIndexed[3]" size="2" maxlength="2"/>
      </td>
      <td>
         &nbsp;
      </td>
      <td>
         <html:text name="rulesForm" property="leadIndexed[3]" size="2" maxlength="2"/>
      </td>
      <td>
         /
      </td>
      <td>
         <html:text name="rulesForm" property="studentIndexed[3]" size="2" maxlength="2"/>
      </td>   
   </tr>

<tr>
      <td>
         From
      </td>
      <td>
         <html:select name="rulesForm" property="startTimeIndexed[4]">
            <html:option value=""></html:option>
            <html:option value="8">8:00 AM</html:option>
            <html:option value="9">9:00 AM</html:option>
            <html:option value="10">10:00 AM</html:option>
            <html:option value="11">11:00 AM</html:option>
            <html:option value="12">12:00 PM</html:option>
            <html:option value="13">1:00 PM</html:option>
            <html:option value="14">2:00 PM</html:option>
            <html:option value="15">3:00 PM</html:option>
            <html:option value="16">4:00 PM</html:option>
            <html:option value="17">5:00 PM</html:option>
            <html:option value="18">6:00 PM</html:option>
         </html:select>
      </td>
      <td>
         to
      </td>
      <td>
         <html:select name="rulesForm" property="endTimeIndexed[4]">
            <html:option value=""></html:option>
            <html:option value="9">9:00 AM</html:option>
            <html:option value="10">10:00 AM</html:option>
            <html:option value="11">11:00 AM</html:option>
            <html:option value="12">12:00 PM</html:option>
            <html:option value="13">1:00 PM</html:option>
            <html:option value="14">2:00 PM</html:option>
            <html:option value="15">3:00 PM</html:option>
            <html:option value="16">4:00 PM</html:option>
            <html:option value="17">5:00 PM</html:option>
            <html:option value="18">6:00 PM</html:option>
            <html:option value="19">7:00 PM</html:option>
         </html:select>
      </td>
      <td>
         :
      </td>
      <td>
         <html:text name="rulesForm" property="minIndexed[4]" size="2" maxlength="2"/>
      </td>
      <td>
         &nbsp;
      </td>
      <td>
         <html:text name="rulesForm" property="maxIndexed[4]" size="2" maxlength="2"/>
      </td>
      <td>
         &nbsp;
      </td>
      <td>
         <html:text name="rulesForm" property="leadIndexed[4]" size="2" maxlength="2"/>
      </td>
      <td>
         /
      </td>
      <td>
         <html:text name="rulesForm" property="studentIndexed[4]" size="2" maxlength="2"/>
      </td>   
   </tr>

<tr>
      <td>
         From
      </td>
      <td>
         <html:select name="rulesForm" property="startTimeIndexed[5]">
            <html:option value=""></html:option>
            <html:option value="8">8:00 AM</html:option>
            <html:option value="9">9:00 AM</html:option>
            <html:option value="10">10:00 AM</html:option>
            <html:option value="11">11:00 AM</html:option>
            <html:option value="12">12:00 PM</html:option>
            <html:option value="13">1:00 PM</html:option>
            <html:option value="14">2:00 PM</html:option>
            <html:option value="15">3:00 PM</html:option>
            <html:option value="16">4:00 PM</html:option>
            <html:option value="17">5:00 PM</html:option>
            <html:option value="18">6:00 PM</html:option>
         </html:select>
      </td>
      <td>
         to
      </td>
      <td>
         <html:select name="rulesForm" property="endTimeIndexed[5]">
            <html:option value=""></html:option>
            <html:option value="9">9:00 AM</html:option>
            <html:option value="10">10:00 AM</html:option>
            <html:option value="11">11:00 AM</html:option>
            <html:option value="12">12:00 PM</html:option>
            <html:option value="13">1:00 PM</html:option>
            <html:option value="14">2:00 PM</html:option>
            <html:option value="15">3:00 PM</html:option>
            <html:option value="16">4:00 PM</html:option>
            <html:option value="17">5:00 PM</html:option>
            <html:option value="18">6:00 PM</html:option>
            <html:option value="19">7:00 PM</html:option>
         </html:select>
      </td>
      <td>
         :
      </td>
      <td>
         <html:text name="rulesForm" property="minIndexed[5]" size="2" maxlength="2"/>
      </td>
      <td>
         &nbsp;
      </td>
      <td>
         <html:text name="rulesForm" property="maxIndexed[5]" size="2" maxlength="2"/>
      </td>
      <td>
         &nbsp;
      </td>
      <td>
         <html:text name="rulesForm" property="leadIndexed[5]" size="2" maxlength="2"/>
      </td>
      <td>
         /
      </td>
      <td>
         <html:text name="rulesForm" property="studentIndexed[5]" size="2" maxlength="2"/>
      </td>   
   </tr>

   <tr>
      <td colspan="12" align="center">
         <html:submit>Apply</html:submit>
         <html:reset>Reset</html:reset>
         <html:cancel>Cancel</html:cancel>
      </td>
   </tr>















</table>

</html:form>

</center>
