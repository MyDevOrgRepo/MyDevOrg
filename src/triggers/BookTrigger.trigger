trigger BookTrigger on HeyLightning__Book__c (before insert,before update) {

    if(Trigger.isBefore)
    {
        if(Trigger.isInsert)
        {
            
        }
        else if(Trigger.isupdate)
        {
            BookTriggerHandler bth = new BookTriggerHandler();
        	bth.validate(trigger.new);
        }
        	
    }
    else if (Trigger.isAfter)
    {
        if(Trigger.isInsert)
        {
            
        }
        else if(Trigger.isupdate)
        {
            
        }
    }
    
}