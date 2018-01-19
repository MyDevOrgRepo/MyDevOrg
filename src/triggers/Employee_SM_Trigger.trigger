trigger Employee_SM_Trigger on Employee_SM__c (before insert,before update,after insert,after update) {

    if(trigger.isBefore)
    {
        
        if(Trigger.isInsert)
        {
                
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