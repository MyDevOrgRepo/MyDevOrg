public class dummy_name_no_modification {

    /*
    	DummyObject__c dummy  = new DummyObject__c(name='rohit');
        DummyObject__c dummy1  = new DummyObject__c(name='nilesh');
        DummyObject__c dummy2  = new DummyObject__c(name='vishal');
    */
     List<DummyObject__c> dom = new List<DummyObject__c>();
    
    public dummy_name_no_modification(List<DummyObject__c> doo)
    {
        dom=doo;
       // insert dummy;
  //      insert dummy1;
   //     insert dummy2;
       	
    }
    
    public void no_name_modification()
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