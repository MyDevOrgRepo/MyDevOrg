@isTest
public class TestTorFxOzPhoneRegistration {

    
    public static account acc{get;set;}
    public static id accid{get;set;}
    public contact con{get;set;}
    public static TorFxOzPhoneRegistration tofr {get;set;}
    			public void init()
                {
                    
                    acc = new account(name='Rohit Joshi',email__C='rrjoshi89@gmail.com',phone='123456789');
                    insert acc;
                    
                }
    
    			public static testmethod void mytests()
                {
                    
                    acc=[select id from account where id=:acc.id limit 1];
                    accid=acc.id;
                    tofr = new TorFxOzPhoneRegistration();
                    tofr.controllermethod();
                                        
                }
    
    
}