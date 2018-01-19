public class SearchingSortedDemoController
{

    public lead l{get;set;}
    public List<SelectOption> getCountries{get;set;}
    public List<SelectOption> getLeadTypes{get;set;}
    public List<SelectOption> getBranches{get;set;}
    public List<SelectOption> getSortingOptions{get;set;}

    public String selectedSortOrder{get;set;}

    public SearchingSortedDemoController()
    {
        l = new lead();
        getCountries();
        getLeadTypes();
        getBranches();
        getSortingOptions();
    }
    
    public List<SelectOption> getCountries()
    {
          List<SelectOption> options = new List<SelectOption>();
        
           Schema.DescribeFieldResult fieldResult = lead.Country_of_interest__c.getDescribe();
           List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        
           for( Schema.PicklistEntry f : ple)
           {
              options.add(new SelectOption(f.getLabel(), f.getValue()));
           }       
           return options;
    }
    
    public List<SelectOption> getLeadTypes()
    {
          List<SelectOption> options = new List<SelectOption>();
        
           Schema.DescribeFieldResult fieldResult = lead.type__c.getDescribe();
           List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        
           for( Schema.PicklistEntry f : ple)
           {
              options.add(new SelectOption(f.getLabel(), f.getValue()));
           }       
           return options;
    }
    
    public List<SelectOption> getBranches()
    {
          List<SelectOption> options = new List<SelectOption>();
        
           Schema.DescribeFieldResult fieldResult = lead.branch__c.getDescribe();
           List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        
           for( Schema.PicklistEntry f : ple)
           {
              options.add(new SelectOption(f.getLabel(), f.getValue()));
           }       
           return options;
    }
    
    public List<SelectOption> getSortingOptions()
    {
          List<SelectOption> options = new List<SelectOption>();
        
            options.add(new SelectOption('Ascending', 'Ascending'));
            options.add(new SelectOption('Descending', 'Descending'));
          
          return options;
    }
    
    
    
}