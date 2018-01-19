public class send_email_on_field_updation_candidate {

   List<Candidate__c> seofd ;
    List<Messaging.SingleEmailMessage> mails =  new List<Messaging.SingleEmailMessage>();
    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    public send_email_on_field_updation_candidate(List<candidate__c> placeHolder)
    {
        seofd = placeHolder;
    }
    
    public void sendEmail()
    {
        
        List<String> emailIds = new List<String>();
        for(Candidate__c c:seofd)
        {
           System.debug(c.Id);
            List<Candidate__c> candiemail=[select email__c from candidate__c where candidate__c.id=:c.id];        
 			           	
            for(candidate__c c1 : candiemail)
            {
	        	emailIds.add(c1.email__c);
                System.debug(c1.Email__c);
            }
            mail.setToAddresses(emailIds);
             mail.setReplyTo('rrjoshi12@gmail.com');
      mail.setSenderDisplayName('SupportForYou@24by7.com');
            //mail.setCcAddresses(list of email ids of cc's	);
            mail.setSubject('Your City is updated of candidate profile');
            String body='<html><body><b>Dear '+c.Name+'<b/><br>,'+'This is the notification mail on the updation of';
            body+='your city in the candidate profile registered in our recryuiting application<br>';
            body+='<b><u>Following are the details:<u><b><br>';
            body+='<b>Candidate Number:</b><br>'+c.Name;
            body+='</b>Candidate Name:</b><br>'+c.First_Name__c+' '+c.Last_Name__c;
            Candidate__c old_City=(Candidate__c)Trigger.oldMap.get(c.Id);
            body+='<b>city before updation:</b><br>'+old_city.City__c;
            body+='<b>city after updation:</b><br></body></html>'+c.City__c;
            mail.setHtmlBody(body);
            mails.add(mail);
            Messaging.sendEmail(mails);
        }
                
    }
    
    
    public void sendEmailToCandidate()
    { 
        
        sendEmail();
        
    }
    
}