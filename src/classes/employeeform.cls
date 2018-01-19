public class employeeform {

    public String getLname() {
        return lname;
    }

 
    
    public String getFname() {
        return fname;
    }


    public String fname{get;set;}
    public String lname{get;set;}
    public String designation{get;set;}
    public String department{get;set;}
    public void insertRecord()
    {
        System.debug('In display');
               System.debug('First_name:'+getFname());
        		System.debug('Last_name:'+getLname());
    	Employee__c emp = new Employee__c(First_Name__c=fname,Last_Name__c=lname,designation__c=designation,department__c=department);
        insert emp;
    	}
    
}