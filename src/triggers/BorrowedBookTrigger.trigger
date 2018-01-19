trigger BorrowedBookTrigger on HeyLightning__Borrowed_Books__c (before insert) {

    if(Trigger.isBefore)
    {
        if(Trigger.isInsert)
        {
            BorrowedBookTriggerHandler bbth = new BorrowedBookTriggerHandler();
            bbth.validate(trigger.new);
        }
        else if(Trigger.isUpdate)
        {
            
        }
    }
    else if(Trigger.isAfter)
    {
        if(Trigger.isInsert)
        {
            
        }
        else if(Trigger.isUpdate)
        {
            
        }        
    }
    
}