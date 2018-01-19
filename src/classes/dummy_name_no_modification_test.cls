@isTest
public class dummy_name_no_modification_test {
 
    	
    
   static  List<DummyObject__c> dom = new List<DummyObject__c>();
  static  DummyObject__c dummy  = new DummyObject__c(name='rohit');
       static DummyObject__c dummy1  = new DummyObject__c(name='nilesh');
        static DummyObject__c dummy2  = new DummyObject__c(name='vishal');
    public static void insertData()
    {       
        insert dummy;
        insert dummy1;
        insert dummy2;
    }
    
    public static void updateData()
    {
        dummy.Name='shekhar';
        dummy1.Name='sachin';
        dummy2.Name='nilesh';
        
        update dummy;
        update dummy1;
        update dummy2;
        
    }
    
    
    public dummy_name_no_modification_test(List<DummyObject__c> doo)
    {System.debug('In constructor');
     
        dom=doo;
        
       	
        System.debug('before update');
        
        System.debug('after update dummy');
        
    }
    
    public static testMethod void no_name_modification()
    {
        List<DummyObject__c> dumm1 =[select DummyObject__c.Name from DummyObject__c];
         for(DummyObject__c d1:dumm1)
            {
        for(DummyObject__c don:dom)
        {
           System.debug('Don is:'+don.Name);
           System.debug('d1 is:'+d1.Name);
           
                if(!don.Name.equals(d1.Name))
            	don.addError('Can not update Dummy object name!!!');
            }
        }
    }
}