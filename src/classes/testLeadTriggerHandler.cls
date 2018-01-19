@isTest
public class testLeadTriggerHandler {


public static testmethod void testAutoLeadConversion()

{

    //data Initialization
    
    Lead l = new lead(company='MytestClassTest',firstname='MyTest',LastName='MyTest1',type__C='Registration',email='rrjoshi12@gmail.com',phone='12345432134',status='Open-Not Contacted');
    
    //Lead insertion of type 'Registration'
    insert l;
}

}