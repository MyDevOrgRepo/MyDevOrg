trigger TestTrigger on TestObjectApex__c (before insert,after Insert) {
/*
    if(Trigger.isBefore)
    {
    if(Trigger.isInsert)
    {
    List<lookuptask__c> lst = [select TestObjectApex__c from lookuptask__c];
    List<lookuptask__c> lst2 = new List<lookuptask__c>();
    
    for(lookuptask__c lst1:lst)
    {
    if(!lst1.testobjectApex__c)    
    {
        lst1.testobjectApex__c=true;
        lst2.add(lst1);
    }
    }
    update lst2;
    }
        /*test code for updating same object on befor-insert, 
         * but as trigger.old is applicable to update event only
         * it causes nullPointer Exception.*/
/*        
List<TestObjectApex__c> lst1= new List<TestObjectApex__c>();
        for(TestObjectApex__c lst:trigger.old)
        {
            lst.name='Rohit';
            lst1.add(lst);
        }
        
        update lst1;
    }
  */


    /*test code for after-insert updation*/
    //Same object cannot be updated, as the record is "Read-Only" in after insert case.
    /*
    if(Trigger.isAfter)
    {
    if(Trigger.isInsert)
    {
    List<lookuptask__c> lst = [select TestObjectApex__c from lookuptask__c];
    List<lookuptask__c> lst2 = new List<lookuptask__c>();
    
    for(lookuptask__c lst1:lst)
    {
    if(lst1.testobjectApex__c)    
    {
        lst1.testobjectApex__c=false;
        lst2.add(lst1);
    }
    }
    update lst2;
    }
        List<TestObjectApex__c> lst1= new List<TestObjectApex__c>();
        for(TestObjectApex__c lst:trigger.new)
        {
            lst.name='Rohit';
            lst1.add(lst);
        }
        
        update lst1;
    }
    */
}