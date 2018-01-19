trigger current_employee_not_blank on Candidate__c (before insert,before update) {

    
    if(Trigger.isInsert || Trigger.isUpdate)
    {
        for(Candidate__c c:Trigger.new)
        {
            if(c.Currently_Employeed__c)
            {
                if(String.isBlank(c.Current_Employer__c))
                {
                    c.addError('Please provide current employer!!!');
                }
                if(c.US_Citizen__c==true && String.isBlank(c.SSN__c))
                {
                    c.addError('Please provide SSN number!!!');
                }
                
            }
        }
    }
}