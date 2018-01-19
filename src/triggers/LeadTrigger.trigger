trigger LeadTrigger on Lead (before insert,after insert) {

    if(Trigger.isbefore)
    {
        if(Trigger.isInsert)
        {
            
        }
        
    }
    if(Trigger.isafter)
    {
        if(Trigger.isInsert)
        {
            LeadTriggerHandler lth = new LeadTriggerHandler();
            //lth.autoConvertLead(Trigger.new);
            lth.handleAfter(Trigger.new);
        }
        
    }
    
}