trigger TimeTableTrigger on HeyLightning__TimeTable__c (before insert,before update,after insert,after update) {

    if(trigger.isBefore)
    {
        if(trigger.isInsert)
        {
            TimeTableTriggerHandler ttth = new TimeTableTriggerHandler();
            ttth.getExistingRecords();
            ttth.checkDuplicates(trigger.new);
        }
        else if(trigger.isUpdate)
        {
            
        }
        
    }
    else if(trigger.isAfter)
    {
        if(trigger.isInsert)
        {
            
        }
        else if(trigger.isUpdate)
        {
            
        }
    }
    
}