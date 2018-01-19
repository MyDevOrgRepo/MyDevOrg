trigger RestrictionOnPositionDeletion on Position__c (before delete) {
    if(Trigger.isDelete)
    {
        for(Position__c psn:Trigger.old)
        {
            psn.addError('This position cannot be deleted!!!');
        }
    }
}