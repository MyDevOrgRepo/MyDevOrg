public class StaffTriggerHandler {

    public List<Employee_SM__c> emp_list = new List<Employee_SM__c>();
    public StaffTriggerHandler()
    {

    }
    
    public void fillEmployeeDetailsAuto(List<Staff__c> staffList)
    {
        List<ID> empList = new List<ID>();
        for(Staff__c stf: staffList)
        {
            //empList+='id=:'+stf.Employee__c+', or ';
            empList.add(stf.Employee__c);
        		}
        //empList = empList.substring(0, empList.length()-1);
        
        Map<ID,Employee_SM__c> empMap = new Map<ID,Employee_SM__c> ([select name,first_name__c,last_name__c,phone__c,email__c from employee_SM__c where id= :empList]);
        List<Staff__c> stfToInsert = new List<Staff__c>();
        for(Staff__c stf: staffList)
        {
            if(empMap.containsKey(stf.Employee__c))
            {
                Employee_SM__c emp = empMap.get(stf.Employee__c);
                stf.name=emp.Name;
                stf.first_name__c = emp.First_Name__c;
                stf.last_name__c = emp.Last_Name__c;
                stf.phone__c = emp.Phone__c;
                stf.email__c = emp.Email__c;
                
        //        stfTooInsert.add(stf);
            }
        }
        
        
    }
    
    
}