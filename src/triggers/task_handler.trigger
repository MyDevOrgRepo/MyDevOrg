trigger task_handler on Task (after update) {
  
  List<task> t1 = Trigger.new;
  List<id> l1 = new List<id>();
    
    for(task t2:t1)
    {
        l1.add(t2.whatid);
    }
    
  
    
    /*if(Trigger.isBefore)
    {}
  for(task t2:t1)
  {      
      if(t2.status=='Completed')
      {
          t2.TaskCompletedDateTime__c=DateTime.Now();
          l1.add(t2.WhatId);
          
      }
      
      /*if(t2.whatid!=null && String.valueOf(t2.WhatId).startsWith('a01'))
    {
        
    }*/
  //}
    /*List<position__C> p1 = [select id,first_activity_date__c,(select TaskCompletedDateTime__c,whatid from activityHistories where istask=true order by TaskCompletedDateTime__c limit 1) amoldate from position__C where id=:l1];
    
    List<activityhistory> ah = new List<activityhistory>();
    
   for(position__c p2:p1) 
   { 
       //p2.first_activity_date__c = p2.activityHistories.TaskCompletedDateTime__c;
       ah.add(p2.activityHistories);
   }
    List<position__c> p = new List<position__c>();
    for(position__c p2:p1) 
   { 
       for(activityhistory ah1:ah)
       {
           if(p2.Id==ah1.WhatId)
           {
               System.debug('In if');
               p2.first_activity_date__c = ah1.TaskCompletedDateTime__c;
               p.add(p2);
               System.debug('if completed');
           }
       }
       //p2.first_activity_date__c = p2.activityHistories.TaskCompletedDateTime__c;
       //ah.add(p2.activityHistories);
   }
    update p;
    System.debug('position updated');
      */
    map<id,position__c> pos = new map<id,position__c>([select id,(select TaskCompletedDateTime__c from activityHistories where istask=true order by TaskCompletedDateTime__c) from position__C where id=:l1]);
    if(Trigger.isAfter)
    {
        if(Trigger.isupdate)
        {      
            
        }
    }
    
}