package hds;

import java.sql.*;
import java.util.*;
import jakarta.servlet.http.*;
import org.apache.struts.action.*;

public final class ScheduleAction extends Action {

  public ActionForward execute(ActionMapping mapping,
      ActionForm form,
      HttpServletRequest request,
      HttpServletResponse response) throws Exception {
   
   // Forward control to the specified success target
   return (mapping.findForward("success"));

  }
}