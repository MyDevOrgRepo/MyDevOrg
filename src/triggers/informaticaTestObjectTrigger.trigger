trigger informaticaTestObjectTrigger on HeyLightning__informaticatestobject__c (before insert,before update,after insert,after update) {

    if(trigger.isBefore)
    {
        if(trigger.isInsert)
        {
            System.debug('newRecordsBeforeInsert:'+trigger.new);
            System.debug('oldRecordsBeforeInsert:'+trigger.old);
        }
        else if(trigger.isUpdate)
        {
            System.debug('newRecordsBeforeUpdate:'+trigger.new);
            System.debug('newRecordsBeforeUpdate:'+trigger.old);
        }
    }
	
    if(trigger.isAfter)
    {
        if(trigger.isInsert)
        {
            System.debug('newRecordsAfterInsert:'+trigger.new);
            System.debug('newRecordsAfterInsert:'+trigger.old);
        }
        else if(trigger.isUpdate)
        {
            System.debug('newRecordsAfterUpdate:'+trigger.new);
            System.debug('newRecordsAfterUpdate:'+trigger.old);
        }
    }

    
}