public with sharing class MyJavaScriptDemo {

    public MyJavaScriptDemo() {

    }



public Lead l{get;set;}
    public boolean showoutput{get;set;}
    public boolean showinput{get;set;}
    public boolean edit{get;set;}
    public boolean save{get;set;}


    public MyJavaScriptDemo(ApexPages.StandardController controller) {
getInfo();
showoutput=true;
showinput=false;
    }


    
    
   
    public Lead getInfo()
    {
        String recId=apexPages.currentPage().getParameters().get('id');
        
               l = [select firstname,lastname,email,phone,company,createddate,CratedBy__c,LastModified__c,ownerid,fax,birthdate__c,MobilePhone,title,rating from lead where id=:recid];
               
               return l;
    } 
    
    public void edit()
    {
      showinput=true;
      showoutput=false;
       System.debug('showinput:'+showinput);
       System.debug('showoutput:'+showoutput);
        
    }
    
    public void save()
    {
       update l;
        showoutput=true;
        showinput=false;
       
    }

}