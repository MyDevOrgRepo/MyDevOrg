@isTest
public class send_email_test_class {

    static Candidate__c c;
    public static void init()
    {
        for(integer i=0;i<10;i++)
        {
           c = new Candidate__c(first_name__c='abc',last_name__c='xyz',currently_employeed__c=false,city__c='pune',email__c='abc@pqr.com');            
            c.city__c='solapur';
            insert c;
            update c;
        }
    }
    
    public static testMethod void sendEmailTest()
    {
        init();
    }
    
}