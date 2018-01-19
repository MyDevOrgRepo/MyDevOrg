trigger NameandEmailVerification on Candidate__c (before insert) {

    if(Trigger.isInsert)
    {System.debug('in isert');
        Candidate_detail_verification cdv = new Candidate_detail_verification(Trigger.new);
     system.debug('before check');
        cdv.check();
     system.debug('after check');
    }
    
}