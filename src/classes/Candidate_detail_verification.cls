public class Candidate_detail_verification {

    List<Candidate__c> ca;
    
    public Candidate_detail_verification(List<Candidate__c> c1)
    {
        ca=c1;
    }
       
    public void check()
    {System.debug('in check');
        for(Candidate__c c2: ca)
        {
        if(String.isBlank(c2.first_name__c) && String.isBlank(c2.last_name__c) && String.isBlank(c2.email__c))
        {
            System.debug('in if of check');
                    c2.addError('Please ,provide first name,last name and email');
        }
        }
    }
    
}