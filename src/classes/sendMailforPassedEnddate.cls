global class sendMailforPassedEnddate implements Database.Batchable<sObject>
{
    public void sendMailforPassedEnddate()
    {
        
    }
    
    global Database.QueryLocator start(DataBase.BatchableContext BC)
    {
    System.debug('In database.queryLoactor');
        String query = 'select HeyLightning__Library_Account__r.email__c,HeyLightning__Library_Account__r.HeyLightning__First_Name__c,HeyLightning__Book__r.name, HeyLightning__Start_Date__c,HeyLightning__End_Date__c,HeyLightning__Late_Fees__c from heylightning__Borrowed_Books__c where end_date__c< Today';
        return database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Borrowed_Books__c> passedEndDates)
    {
    /*
    Messaging.SingleEmailMessage[] messages =   new List<Messaging.SingleEmailMessage>();
        for(Borrowed_Books__c bb:passedEndDates)
        {
        System.debug('In execute of sendMailforPassedEnddate');
           Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
           String[] toAddresses = new String[] {bb.HeyLightning__Library_Account__r.email__c};
           mail.setTargetObjectIds(bb.id);
           mail.setToAddresses(toAddresses);
           mail.settemplateid(System.Label.EnddatePassedSubject);
           //Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
           
           messages.add(mail);

           
           System.debug('After Mail');
        }
        
        Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
      */
      
       
       /* Mass Email 
       List<id> bbids = new List<id>();
       for(Borrowed_Books__c bb:passedEndDates)
        {
               bbids.add(bb.id);
        }
        
       Messaging.MassEmailMessage mail = new Messaging.MassEmailMessage();
 mail.setTargetObjectIds(bbids);
 mail.setSenderDisplayName('System Admin');
 mail.setTemplateId(System.Label.EnddatePassedSubject);
 Messaging.sendEmail(new Messaging.MassEmailMessage[] { mail }); 
 
 */
 
 /*Single mail*/
 // Step 0: Create a master list to hold the emails we'll send
  List<Messaging.SingleEmailMessage> mails = 
  new List<Messaging.SingleEmailMessage>();
  
  for (borrowed_books__c bb : passedEndDates) {
    
      // Step 1: Create a new Email
      Messaging.SingleEmailMessage mail = 
      new Messaging.SingleEmailMessage();
    
      // Step 2: Set list of people who should get the email
      List<String> sendTo = new List<String>();
      sendTo.add(bb.HeyLightning__Library_Account__r.email__c);
      mail.setToAddresses(sendTo);
    
      // Step 3: Set who the email is sent from
      //mail.setReplyTo(''); kept empty meanwhile
    //  mail.setSenderDisplayName('Official Bank of Nigeria');
    
      // (Optional) Set list of people who should be CC'ed
      List<String> ccTo = new List<String>();
      ccTo.add('rrjoshi12@gmail.com');
      mail.setCcAddresses(ccTo);

      // Step 4. Set email contents - you can use variables!
      mail.setSubject('End date passed for your borrowed book');
      String body = 'Dear ' + bb.HeyLightning__Library_Account__r.HeyLightning__First_Name__c + ', <br>';
      body += 'Your end date for returning a book named' + bb.HeyLightning__Book__r.name + 'has already passed on its end date, i.e.' +bb.HeyLightning__End_Date__c+'<br>';
      body += 'Kindly return the same as early as possible.<br><br>';
      body += 'Please find following book details:<br>';
      body += 'Book Name: '+bb.HeyLightning__Book__r.name+'<br>';
      body += 'Book Borrowed Date: '+ bb.HeyLightning__Start_Date__c+'<br>';
      body += 'Estimated date of book return:' +bb.HeyLightning__End_Date__c+'<br><br>' ;
      body += 'Your\'s sincere,Library Administrator'+'<br><br>' ;
body += 'Note: Fine for returning it late till date is:' +bb.HeyLightning__Late_Fees__c+'<br>';
      mail.setHtmlBody(body);
    
      // Step 5. Add your email to the master list
      mails.add(mail);
    }
  
  // Step 6: Send all emails in the master list
  Messaging.sendEmail(mails);
 
 
 
    }
    
    
    global void finish(Database.BatchableContext info){     
   }
}