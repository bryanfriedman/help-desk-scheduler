package hds;

import java.sql.*;
import java.util.*;
import jakarta.servlet.http.*;
import org.apache.struts.action.*;

public final class EnterAvailAction extends Action {

  public ActionForward execute(ActionMapping mapping,
      ActionForm form,
      HttpServletRequest request,
      HttpServletResponse response) throws Exception {
   
   HttpSession session = request.getSession();
   String[] days = {"M", "T", "W", "R", "F"};
   session.setAttribute("days", days);

   // Forward control to the specified success target
   return (mapping.findForward("success"));

  }
}