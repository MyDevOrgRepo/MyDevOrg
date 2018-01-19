public with sharing class SearchRecordswithToolbar
{

    public List<Lead> leads {get;set;}
    public List<account> accounts {get;set;}
    public List<contact> contacts {get;set;}
    public List<opportunity> opportunities {get;set;}
        public String searchText {get;set;}
    
   public Boolean showBlock{get;set;}
    
    public SearchRecordswithToolbar()
    {
            leads= new List<lead>();
            accounts = new List<Account>();
            contacts = new List<Contact>();
            opportunities = new List<Opportunity>();
            searchText='';
            showBlock=false;
    }
    
    public void showDetails()
    {
            showBlock=false;
            leads=[select name,phone,email from lead where name=:searchText or phone=:searchText or email=:searchText];
            accounts = [select name,phone,email__c,BillingCity,BillingState,BillingCountry From Account where email__c=:searchText or name=:searchText or phone=:searchText or billingcity=:searchText or billingstate=:searchText or billingcountry=:searchText];
            contacts=[select name,account.name,phone,email,mailingcity,mailingstate,mailingcountry,primary_contact__c from contact where name=:searchText or phone=:searchText or mailingcity=:searchText or mailingstate=:searchText or mailingcountry=:searchText or email=:searchText];
            opportunities=[select name,account.name,stagename,type,probability,closedate from opportunity where name=:searchText];
            showBlock=true;
    }
    
   /* public List<Account>showAccounts()
    {
    accounts = [];
    return accounts;
    
    }
    
    public List<Account>showContacts()
    {
    
    contacts = [];
    return contacts;
    }
    
    public List<Account>showOpportunities()
    {
    opportunties = [];
    return opportunities;
    
    }
*/
}