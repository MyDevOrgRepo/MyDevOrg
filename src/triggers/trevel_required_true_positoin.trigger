trigger trevel_required_true_positoin on Position__c (before insert,before update) {
	for(Position__c p:Trigger.new)
	{
		if(p.Job_Level__c=='IT-100')    	
        {
            p.Travel_Required__c=true;
        }
        else
        {
            p.Travel_Required__c=false;
        }
	}
}