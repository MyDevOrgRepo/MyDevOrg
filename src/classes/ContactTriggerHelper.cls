public class ContactTriggerHelper
{
    public void updateaccount(List<contact> contacts) 
    {
    List<account> accounts  = [select id,email__c,phone from account];
    List<account> updatedaccounts = new List<account>();
        for(Contact contact:contacts)
        {
            for(account acc:accounts)
            {
                if(contact.AccountId.equals(acc.id) && contact.primary_contact__c==true)
                {
                    acc.email__c=contact.email;
                    acc.phone=contact.phone;
                    updatedaccounts.add(acc); 
                }
            }
        }
        update updatedaccounts ;
    }
}