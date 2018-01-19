global class TorFxOzPhoneRegistration
{
    
    public TorFxOzPhoneRegistration()
    {
        
    }

    public TorFxOzPhoneRegistration(ApexPages.StandardController controller) {
    primarycontact = new contact();
    con = new contact();
    controllermethod();
//controllermethod();
    }

    public contact con{get;set;}
    public contact primarycontact{get;set;}
    public String accid{get;set;}
  /*  
    public TorFxOzPhoneRegistration()
    {
    primarycontact = new contact();
    con = new contact();
    controllermethod();
    
    }*/
    
    public void controllermethod()
    {
    
        accid= ApexPages.currentPage().getParameters().get('id');
        System.debug('ID is:'+accid);
        if(accid!=null)
        {
        primarycontact = [select id,salutation,firstname,lastname,birthdate,mailingstreet,mailingcity,MailingPostalCode,mailingstate,mailingcountry,email,mobilephone,phone,title,primary_contact__c from contact where accountid=:accid];
        
         con.id= primarycontact.id;     
         con.firstname= primarycontact.firstname;     
         con.lastname= primarycontact.lastname;  
         con.birthdate = primarycontact.birthdate;           
         con.mailingstreet= primarycontact.mailingstreet;     
         con.mailingcity= primarycontact.mailingcity;     
         con.MailingState = primarycontact.MailingState;
         con.Mailingcountry = primarycontact.Mailingcountry;
         con.MailingPostalCode=primarycontact.MailingPostalCode;         
         con.email= primarycontact.email;     
         con.mobilephone= primarycontact.mobilephone;     
         con.phone= primarycontact.phone;     
         con.title= primarycontact.title;     
         }
    }
    
    public void SaveContact()
    {
              //primarycontact.id= con.id;     
         primarycontact.firstname= con.firstname;     
         primarycontact.lastname= con.lastname;  
         primarycontact.birthdate = con.birthdate;           
         primarycontact.mailingstreet= con.mailingstreet;     
         primarycontact.mailingcity= con.mailingcity;     
         primarycontact.MailingState = con.MailingState;
         primarycontact.Mailingcountry = con.Mailingcountry;
         primarycontact.MailingPostalCode=con.MailingPostalCode;         
         primarycontact.email= con.email;     
         primarycontact.mobilephone= con.mobilephone;     
         primarycontact.phone= con.phone;     
         primarycontact.title= con.title;  
    
               update primarycontact;         
    
    }
}