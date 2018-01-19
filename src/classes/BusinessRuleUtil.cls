public class BusinessRuleUtil
{

	public static Map<id,List<Constraints_Criteria__c>> constraints =  new Map<id,List<Constraints_Criteria__c>>();
   
    public BusinessRuleUtil()
    {

    }
        
    public static List<Constraint_Rule__c> getApplicableRuleList(List<sObject> sObjectLst,String Object_Name)
    {
        List<Constraint_Rule__c> ruleList = new List<Constraint_Rule__c>();
        
        List<Date> lstStartDates  = new List<Date>();
        List<Date> lstEndDates  = new List<date>();
        
        
        	if(sObjectLst instanceof List<class__c>)
        	{
        		List<class__c> clsLst =(List<class__c>) sObjectLst;
        		for(class__c cls:clsLst)
        		{
        			lstStartDates.add(cls.start_date__c);
        			lstEndDates.add(cls.end_date__c);
        		}
        	}
        
        ruleList = [select id, name,start_date__c,end_date__c,(select id,name,Criteria__c,provide_value_from_field__c,Value__c,value_from_field__c from Constraints_Criterias__r) from Constraint_Rule__c where Objects__c=:Object_Name and start_Date__c <= :lstStartDates and end_Date__c >= :lstEndDates];
        
        for(Constraint_Rule__c rule:ruleList)
        {
        		constraints.put(rule.id,rule.Constraints_Criterias__r);
        }
        
        
        if(ruleList.size()>0)
        {
                //throw new CustomSettingException(String.format(System.Label.NO_CRUD_FLS, arguments));
            //throw new CustomSettingException('Error: Rules Exists');
            System.debug('Error:Rule List:'+ruleList);
            validationErrors(sObjectLst,ruleList);
        }
        
        return ruleList;
    }    
    
    public static List<String> validationErrors(List<sObject> sObjectLst,List<Constraint_Rule__c> ruleList)
    {
    	if(sObjectLst instanceof List<class__c>)
        	{
        		List<class__c> clsLst =(List<class__c>) sObjectLst;
        		
        		
        		for(Constraint_Rule__c rule:ruleList)
        		{
        			List<Constraints_Criteria__c> criterias = constraints.get(rule.id);
        			
        			for(Constraints_Criteria__c criteria:criterias)
        			{
        		Map<String, Schema.SObjectField> objectFields = Schema.getGlobalDescribe().get('heylightning__Constraints_Criteria__c').getDescribe().fields.getMap();
        				
        					for(String apiName:objectFields.keySet())
        					{
        						System.debug('apiName is:'+apiName);
        					}
        			}
        		}
        		
        	
        	}
			return null;			 
    }

}