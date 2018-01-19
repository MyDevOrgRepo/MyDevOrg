trigger more_than_2_attempts on Job_Application__c (before insert) {
    
    /*first version*/
    /*
List<Job_Application__c> ja = [select candidate__r.id from job_application__c];
List<id> cad_id=new List<id>();
    
for(Job_Application__c j1:ja)
{
    //System.debug('ID'+j1.candidate__r.id);
    cad_id.add(j1.candidate__r.id);
}*/
//List<candidate__c> names=[select candidate__c.name from candidate__c where candidate__c.id=:cad_id];
/*List<candidate__c> counts=[select count(candidate__c.name) from candidate__c where candidate__c.id=:cad_id];
for(candidate__c c:counts)
{
    System.debug('name is:'+c.name);
}*/
    List<id> cad_id1=new List<id>();
    for(job_application__c j:Trigger.new)
    {
        cad_id1.add(j.candidate__c);
        System.debug('Trigger.new is:'+j.Candidate__c);
        List<AggregateResult> result = [select count(candidate__r.name) total from job_application__c where candidate__r.id=:cad_id1];
    for(AggregateResult r:result)
    {        integer count=(Integer)r.get('total');
     System.debug('Count is:'+count);
     if(count>=2)
     {
         j.addError('You cannot apply for more than 2 postions');
     }
    }
    }
    
  	
}