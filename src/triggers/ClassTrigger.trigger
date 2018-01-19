trigger ClassTrigger on Class__c (before insert,after insert,before update,after update) {

    if(Trigger.isBefore)
    {
        
        if(Trigger.isInsert)
        {
				ClassTriggerHandler cth = new ClassTriggerHandler();
				cth.checkDuplicate(Trigger.new);            
        }
        if(Trigger.isUpdate)
        {
        	ClassTriggerHandler cth = new ClassTriggerHandler();
            cth.checkConstraintRules(trigger.new);
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