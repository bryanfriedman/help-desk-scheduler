package hds.accounts;

import javax.servlet.http.*;
import java.lang.*;
import org.apache.struts.action.*;

public final class PrioritiesForm extends ActionForm {

   /* Account Name */
   private String username = null;
   public String getUsername() {
      return (this.username);
   }
   public void setUsername(String username) {
      this.username = username;
   }

   /* Direction */
   private String direction = null;
   public String getDirection() {
      return (this.direction);
   }
   public void setDirection(String direction) {
      this.direction = direction;
   }

   /* Amount */
   private String amount = null;
   public String getAmount() {
      return (this.amount);
   }
   public void setAmount(String amount) {
      this.amount = amount;
   }


   void reset() {
      
   }


   public ActionErrors validate(ActionMapping mapping,
                           HttpServletRequest request) {
   
   ActionErrors errors = new ActionErrors();
   if ((username == null) || (username.length() < 1))
         errors.add("username",
                 new ActionError("error.username.required"));
   if ((amount == null) || (amount.length() < 1))
         errors.add("amount",
                  new ActionError("error.amount.required"));
   int amt = 0;
   try {
      amt = Integer.parseInt(amount);
   } catch (NumberFormatException e) {
      errors.add("amount", new ActionError("error.amount.number", amount));
   }
   if (amt < 1) {
      errors.add("amount", new ActionError("error.amount.greater"));
   }

   return errors;

   }

}




