trigger no_candidate_eith_job_application_deletion on Candidate__c (before delete) {

    for(Job_Application__c ja:[select Candidate__r.name from job_application__c ])
    {
        for(candidate__c c:[select name from Candidate__c])
        {
            if(ja.Candidate__r.name.equals(c.Name))
            {
                c.addError('Can not delete candidate!!!');
                    
            }
        }
    }
    
}