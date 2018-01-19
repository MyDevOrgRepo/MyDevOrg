trigger position_trigger_new on Position__c (before update,after update) {
    for(position__c p:Trigger.new)
    {
        Position__c pos = Trigger.oldMap.get(p.id);    
        System.debug('Pos is:'+pos);
        System.debug('p is:'+p.Name);
        if(pos.Name.equals(p.Name))
        {
            p.name=pos.Name;
        }
        else
        { 
			
         System.debug(p.name);
            p.addError('Position title cannot be changed');
           
        }
    }
    
    if(Trigger.isAfter)
    {
        	if(Trigger.isUpdate)
            {
                List<position__c> p1 = trigger.new;
                List<position__c> p2 = [select first_activity_date__c,(select TaskCompletedDateTime__c from activityhistories) from position__c];
                for(position__c p3:p1)
                {
                    //p3.first_activity_date__c=p3.activityhistories.TaskCompletedDateTime__c;
                }
            }
    }
    
}