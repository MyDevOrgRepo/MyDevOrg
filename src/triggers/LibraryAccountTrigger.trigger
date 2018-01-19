trigger LibraryAccountTrigger on HeyLightning__Library_Account__c (before insert,before update,after insert,after update) 
{
    	
    	
		
    if(Trigger.isBefore)
        {
            if(Trigger.isInsert)
            {
                LibraryAccountTriggerHandler lath = new LibraryAccountTriggerHandler();
                lath.getLookupDetails(Trigger.new);
                lath.autoFillDetails(Trigger.new);
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