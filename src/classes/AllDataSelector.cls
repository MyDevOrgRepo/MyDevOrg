public with sharing class AllDataSelector {
    
    
    public String getSObjectFields(String sObjectName)
    {
    	String sObjectFields;
    	Map<String,Schema.SObjectField> sObjectAllfieldsMap = Schema.getGlobalDescribe().get(sObjectName.toLowerCase()).getDescribe().Fields.getMap();
		for(Schema.sObjectField field : sObjectAllfieldsMap.values())
		{
			Schema.DescribeFieldResult fieldResult = field.getDescribe();
			if(sObjectFields=='' || sObjectFields==null)
			{
				
				System.debug('Field API Name>>'+fieldResult.getName());
				System.debug('Field Label'+fieldResult.getLabel());			
				sObjectFields = fieldResult.getName();
			}
			else
			{
				sObjectFields+=','+fieldResult.getName();
			}
		}
    	return sObjectFields;
    }
    
}