trigger city_modify_candidate on Candidate__c (before update) {

    if(Trigger.isUpdate)
    {
        send_email_on_field_updation_candidate candi = new send_email_on_field_updation_candidate(Trigger.new);
        candi.sendEmailToCandidate();
    }
    
}