public with sharing class leadDemo
{

    public Lead lead{get;set;}
    public List<contact> primarycon{get;set;}
    public id accid{get;set;}
    public account accdetails{get;set;}
    
    
    public leadDemo(ApexPages.StandardController controller) {
        accid=ApexPages.currentpage().getparameters().get('id');
        lead = new Lead();
       // primarycon = new contact();
        controllermethod();

    }







public void controllermethod()
{

primarycon=[select salutation,firstname,joint_contact_id__c,primary_Contact__c,lastname,birthdate,mailingstreet,mailingcity,mailingstate,mailingcountry,mailingpostalcode,phone,mobilephone,email,title from contact where accountid=:accid];
accdetails = [select name from account where id=:accid];
        lead.type__c='Registration';
        lead.company=accdetails.name;
System.debug('Lead company:'+lead.company);
        //lead.applicationtype__c='single';
        for(Contact con:primarycon)
        {
        if(con.primary_Contact__c==true)
        {
        lead.salutation=con.salutation;
        lead.firstname=con.firstname;
        lead.lastname=con.lastname;
        lead.birthdate__c=con.birthdate;
        lead.street=con.mailingstreet;
        lead.city=con.mailingcity;
        lead.state=con.mailingstate;
        lead.country=con.mailingcountry;
        lead.postalcode=con.mailingpostalcode;
        lead.phone=con.phone;
        lead.mobilephone=con.mobilephone;
        lead.title=con.title;
        lead.email=con.email;
    }
    else
    {
            lead.salutation_second_contact__c= con.salutation;
            lead.second_Contact_firstname__c=con.firstname;
            lead.second_Contact_lastname__c=con.lastname;
            lead.Birthdate_second_contact__c=con.Birthdate;
            lead.phone_second_Contact__c=con.phone;
            lead.email_second_contact__c=con.email;
    }
 }   
}

public void SaveLead()
{
insert lead;
redirect();
}

public PageReference redirect()
    {
        PageReference pr = new PageReference('https://ap2.salesforce.com/'+accid);
        pr.setredirect(true);
        return pr;
        
    }

}