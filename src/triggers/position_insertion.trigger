trigger position_insertion on Position__c (before insert) {
    for(position__c p:trigger.new)
    {
		if(String.isBlank((p.job_level__c)))
		{
    		p.addError('Cannot create new position!!! Job level field is empty!!!');
		}
    }
}