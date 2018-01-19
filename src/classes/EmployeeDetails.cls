public class EmployeeDetails
{

    public String lstemp { get; set; }

    public String show { get; set; }

        public employee__c employee{get;set;}

        public EmployeeDetails()
        {
        
                employee = new employee__C();
        
        }
        
        
        public void SaveEmployee()
        {
        
            insert employee;
        
        }

}