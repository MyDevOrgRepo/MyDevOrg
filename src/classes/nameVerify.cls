@isTest
public class nameVerify {
		
    	/*negative test case data*/
        /*static Candidate__c ca = new Candidate__c(Currently_Employeed__c=false,ssn__c='111111111');
        static Candidate__c ca1 = new Candidate__c(Currently_Employeed__c=false,ssn__c='222222222');
        static Candidate__c ca2 = new Candidate__c(Currently_Employeed__c=false,ssn__c='333333333');
    */
    
    	/*positiv test case data*/
	    static Candidate__c ca = new Candidate__c(Currently_Employeed__c=false,ssn__c='111111111',first_name__c='rohit',last_name__c='joshi');
        static Candidate__c ca1 = new Candidate__c(Currently_Employeed__c=false,ssn__c='222222222',first_name__c='rohit',last_name__c='joshi');
        static Candidate__c ca2 = new Candidate__c(Currently_Employeed__c=false,ssn__c='333333333',first_name__c='rohit',last_name__c='joshi');
    public static void init()
    {
        
        insert ca;
        insert ca1;
        insert ca2;
    }
    
    public static testMethod void testIt()
    {Test.startTest();
        init();
     Test.stopTest();
    }
    
}