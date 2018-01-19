trigger StaffTrigger on Staff__c (before insert,before update,after insert,after update) {

    if(trigger.isBefore)
    {
        
        if(Trigger.isInsert)
        {
                StaffTriggerHandler sth = new StaffTriggerHandler();
            sth.fillEmployeeDetailsAuto(Trigger.new);
        }
        else if(Trigger.isUpdate)
        {
            
        }
    }
    if(trigger.isAfter)
    {
        if(Trigger.isInsert)
        {
            
        }
        else if(Trigger.isUpdate)
        {
            
        }
    }
    
    
}