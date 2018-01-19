public class myControllerPractice
{

public TestObjectApex__c toa{get;set;}

public account acc{get;set;}
public List<contact> cons{get;set;}
public List<opportunity> opps{get;set;}
public boolean showAccTable{get;set;}
public boolean showConTable{get;set;}
public boolean showOppTable{get;set;}
public List<contact> conDetails{get;set;}
public List<opportunity> oppDetails{get;set;}
public PageReference disableButtons{get;set;}


/*Pagination Declarations Starts*/

    Public Integer size{get;set;} 
    Public Integer noOfRecords{get; set;} 
    public List<SelectOption> paginationSizeOptions{get;set;}

/*Pagination Declarations Ends*/




public boolean hideButtons{get;set;}
public pageReference refreshPageSize{get;set;}

public myControllerPractice()
{
toa = new TestObjectApex__c();
cons = new List<contact>();
opps = new List<opportunity>();
hideButtons=true;

/*Pagination*/
size=5;
        paginationSizeOptions = new List<SelectOption>();
        paginationSizeOptions.add(new SelectOption('5','5'));
        paginationSizeOptions.add(new SelectOption('10','10'));
        paginationSizeOptions.add(new SelectOption('20','20'));
        paginationSizeOptions.add(new SelectOption('50','50'));
        paginationSizeOptions.add(new SelectOption('100','100'));
/*Pagination*/

}
        public PageReference accDetails()
        {
            showAccTable=true;
            showConTable=false;
            showOppTable=false;
            acc=[select id,name,billingcity,phone,email__c from account where id=:toa.account__c];
            return null;
        }
        
        public List<contact> conDetails()
        {
            showConTable=true;
            cons=[select name,mailingcity,mailingstate,mailingcountry,phone,email,Primary_Contact__c from contact where accountid=:acc.id];
            return null;       
        }
        
        public List<opportunity> oppDetails()
        {
            showoppTable=true;
            //opps=[select name,type,stagename,closedate,probability from opportunity where accountid=:acc.id];
            opps = (List<Opportunity>) setCon.getRecords();
            return null;       
        }

        public boolean disableButtons()
        {
            hideButtons=false;
            return false;
        }
        
        
        /*Pagination Starts*/
        public ApexPages.StandardSetController setCon {
        get {
            if(setCon == null) {                
     /*           setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                      [select id,Name,AccountId,Account.name,Amount,StageName,CloseDate,LastModifiedDate from Opportunity]));
       */
               setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                      [select name,type,stagename,closedate,probability from opportunity ]));
       
                setCon.setPageSize(size);  
                noOfRecords = setCon.getResultSize();
            }            
            return setCon;
        }
        set;
    }
    
    
     
    //Changes the size of pagination
    public PageReference refreshPageSize() {
         setCon.setPageSize(size);
         return null;
    }
        /*Pagination Ends*/
        

}