## 2.2.1. Account Administration

When the "Accounts" button is pressed on the menu, the following screen appears in the content frame:

![](images/main-account.jpg)

This page lists all of the accounts currently in the system, as well as some details about those accounts. The fields roughly correspond to the fields in the "Add An Account" form as detailed [below](#2-2-1-1-adding-an-account). Some extra fields include the account creation date and the priority level, which is discussed in detail in [Section 2.2.2.](priorities.md) The buttons on the bottom correspond to the following three operations (described in detail below):

- The "Add" button is used for [Adding an Account](#2-2-1-1-adding-an-account).
- The "Delete" button is used for [Deleting an Account](#2-2-1-2-deleting-an-account).
- The "Modify" button is used for [Modifying an Account](#2-2-1-3-modifying-an-account).

There are also a couple of special things about [Modifying the Administrator Account](#2-2-1-4-modifying-the-administrator-account), so a separate section has been included for this.

### 2.2.1.1. Adding an Account

When the "Add" button is clicked on the Main Accounts page, the following screen appears in the content frame:

![](images/add-account.jpg)

The fields on the Add An Account form are as follows:

- The "Account Name" field is for the name used to log in to the account. This must be a unique name (not used by another user) and must be between 3 and 8 alphabet characters (no numbers or special characters). The field will not let you enter more than 8, and you will get an error if you try to submit less than 3.
- The "Full Name" field is for the user's full name. This is also an alphabet characters field only, and can be anywhere from 1 to 40 characters. It may not be empty.
- The "E-Mail" field is for the user's e-mail address. This must be a valid e-mail address and it may not be left empty.
- The "Account Type" field is a drop-down menu allowing you to select one of three account types: "Administrator", "Lead Student", and "Student Assistant". This is the account type. See [Section 2.4](../privileges/privileges.md) for details on privileges for different account types.
- The "Password" field is for the user's password. The only rules for this field is that the password must be at least 6 characters. If you would prefer to have a password randomly generated, you may click the "Random" button to the right of the "Password" field to have it populated with a random password. Upon submission of the form, this password (along with other account details) will be e-mailed to the user's e-mail address as specified by the "E-Mail" field.
- Finally, the "Work Start Date" field is for the date when this user first began working. This must be a valid date. The "..." button may be pressed to select a date from the calendar pop-up to populate the field.

The "Add" button is used to submit the form and add the account. This will e-mail the new user with the account information and will return to the Main Accounts Page. The "Reset" button will clear all the fields of the form, and the "Cancel" button will return to the Main Account page. If any of the above requirements are not met, an error will appear upon submission and the data will need to be re-entered and the form resubmitted.

Here is an example of a properly filled out form:

![](images/add-account-done.jpg)

### 2.2.1.2. Deleting an Account

When the "Delete" button is clicked on the Main Accounts page, the following screen appears in the content frame:

![](images/delete-account.jpg)

The menu shown is a list of current account names in the database except for the main Administrator account and the user who is currently logged in (since neither of these accounts can be deleted). One or more accounts can be chosen by clicking on the account name in this menu. To select multiple accounts, use the CTRL or SHIFT keys.

The "Delete" button is used to submit the form and delete the selected account(s). The "Reset" button will clear all the fields of the form, and the "Cancel" button will return to the Main Account page. If no account is chosen, an error will appear on submission.

### 2.2.1.3. Modifying an Account

When the "Modify" button is clicked on the Main Accounts page, the following screen appears in the content frame:

![](images/modify-account.jpg)

The form is almost identical to the Add An Account form as detailed [above](#2-2-1-1-adding-an-account). The differences are as follows:

- There is an extra field that is a drop-down menu of all account names currently in the database. When this is changed, the entire form is repopulated based on that selection. The "New Account Name" field below this is where you can enter a new account name for that account.
- There is also a new field to select whether or not the account should be activated or not. This is for when a user should not be included in schedule generation or operations (i.e. the student is on leave for a quarter or something). More details regarding active and inactive accounts are detailed in [Section 2.2.4.](generating.md) in the discussion of automatic schedule generation.
- The "New Account Name" and "Account Type" fields will be disabled (grayed-out) when the currently logged in user or the main Administrator account is selected.
- Finally, the "Work Start Date" field is not present since this cannot be changed.

The "Apply" button is used to submit the form and modify the account. This will e-mail the user with the new account information and will return to the Main Accounts Page. The "Reset" button will clear all the fields of the form, and the "Cancel" button will return to the Main Account page. If any of the field requirements are not met, an error will appear upon submission and the data will need to be re-entered and the form resubmitted.

### 2.2.1.4. Modifying the Administrator Account

When modifying the main Administrator account, the main Administrator must be logged in. Nothing can be changed about the account except for the "Password", the "Full Name", and the "E-Mail".

* * *
Prev: \[none] | Next: [priorities](priorities.md) | Up: [administrator](administrator.md) | Top: [index](../../index.md)
* * *
