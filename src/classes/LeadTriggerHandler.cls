public class LeadTriggerHandler {


public void handleBefore(List<Lead> l)
{

}
public void handleAfter(List<Lead> l)
{
List<Lead> l1 = new List<Lead>();
for(Lead l2:l)
{
    if(l2.type__c!=null && l2.type__c.equals('Registration'))
    {
        l1.add(l2);
    }
} 
    autoConvertLead(l1);
}

public void autoConvertLead(List<Lead> l)
{
    List<Database.LeadConvert> ldlc = new List<Database.LeadConvert>();
    List<Messaging.SingleEmailMessage> lms = new List<Messaging.SingleEmailMessage>();
     
    LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
    
    for(Lead l1:l)
    {
        Database.LeadConvert lc = new Database.LeadConvert();
        
        lc.setLeadId(l1.id);
        
        lc.setConvertedStatus(convertStatus.MasterLabel);
       
        ldlc.add(lc);
    }    
    List<Database.LeadConvertResult> lcr = Database.convertLead(ldlc);
        for(Database.LeadConvertResult lcr1:lcr)
        {
            if(lcr1.isSuccess())
            {
                System.debug('Lead autoConversion suceeded..');
                
                System.debug('In autoconvertlead Succeeded');
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                List<String> sendToAddresses = new List<String>();
                sendToAddresses.add('rrjoshi89@gmail.com');
                mail.setToaddresses(sendToAddresses);
                mail.setReplyTo('testmesfdc@gmail.com');
                mail.setSenderDisplayName('Admin:AutoConvertLead');
                
                String htmlBody = 'Lead autoConverted with id:'+lcr1.getLeadID(); 
                mail.setHtmlBody(htmlBody);               
                lms.add(mail);
            }
            else
            {
            System.debug('In autoconvertlead failure');
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                List<String> sendToAddresses = new List<String>();
                sendToAddresses.add('rrjoshi89@gmail.com');
                mail.setToaddresses(sendToAddresses);
                mail.setReplyTo('testmesfdc@gmail.com');
                mail.setSenderDisplayName('Admin:AutoConvertLead');
                
                String htmlBody = 'Lead Fails on autoconversion with id:'+lcr1.getLeadID();
                mail.setHtmlBody(htmlBody);               
                lms.add(mail);
            }
        }
        
        Messaging.sendEmail(lms);
}

}