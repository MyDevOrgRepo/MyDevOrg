trigger DivisionTrigger on Division__c (before insert,before update,after insert,after update) {

    if(Trigger.isBefore)
    {
        if(Trigger.isInsert)
        {
    		DivisionTriggerHandler dth = new DivisionTriggerHandler();
            dth.checkDuplicate(Trigger.new);
        }
        if(Trigger.isUpdate)
        {
            
        }
    }
    if(Trigger.isAfter)
    {
	    if(Trigger.isInsert)
        {
            
        }
        if(Trigger.isUpdate)
        {
            
        }        
    }
    
}