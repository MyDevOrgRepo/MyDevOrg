public class showvfRecords {

    public showvfRecords(EmployeeDetails controller) {

    }


public List<Employee__C> empdetails{get;set;}
public Boolean show=false;
public Boolean hide=false;
public List<id> ids {get;set;}



public showvfRecords()
{

empdetails = [select name,department__c,designation__c from Employee__c];
        
show=true;



}




}