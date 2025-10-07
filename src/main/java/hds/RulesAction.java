package hds;

import java.sql.*;
import java.util.*;
import jakarta.servlet.http.*;
import org.apache.struts.action.*;

public final class RulesAction extends Action {

  public ActionForward execute(ActionMapping mapping,
      ActionForm form,
      HttpServletRequest request,
      HttpServletResponse response) throws Exception {
   
   HttpSession session = request.getSession();

   String defaultRules = request.getParameter("default");

   if ("true".equals(defaultRules)) {

      session.setAttribute("default", "true");
      return (mapping.findForward("success")); 

   } else {

      String def = (String) session.getAttribute("defaultRules");
      session.removeAttribute("defaultRules");

      if ("T".equals(def)) {
         return (mapping.findForward("noRules"));
      } else {
         return (mapping.findForward("success"));  
      }
   }

  }
}