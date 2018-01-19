trigger no_more_than_2_job_applications on Job_Application__c (before insert) {
    if(Trigger.isInsert)
    {
Job_application__c ja1;
    Map<String,Integer> m = new Map<String,Integer>();
    for(Job_Application__c ja:[select Candidate__r.name from job_application__c])
    {
        if(m.containsKey(ja.Candidate__r.name))
        {
            m.put(ja.Candidate__r.name, m.get(ja.Candidate__r.name)+1);
        }
        else
        {
            m.put(ja.Candidate__r.name, 1);
        }
        ja1=ja;
    }
    
        System.debug('Map is:'+m);
    Set<String> s = m.keySet();
    Iterator<String> i = s.iterator();
    
         for(Job_Application__c j1:Trigger.new)
         {
            System.debug('Posotion is:'+j1.Position__r.Name);
            Integer key=m.get(j1.candidate__r.name);
         System.debug('Key is:'+key);
        if(key>=4)
        {
            j1.addError('Cannot apply for more than 2 positions at a time...');
        }
         }
    }
}