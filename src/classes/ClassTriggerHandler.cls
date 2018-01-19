public class ClassTriggerHandler {

    public ClassTriggerHandler()
    {
        
    }
    
    public void checkDuplicate(List<Class__c> clsnew)
    {
        List<Class__c> clslst = [select id,name from class__c];
        
        try
        {
            for(Class__c clsn:clsnew)
            {
                for(Class__c clsex:clslst)
                {
                    
                        if(clsn.name==clsex.name)
                        {
                            clsn.addError('cannot add duplicate class '+clsex.name);
                        }
                    }
                    
                }
            }
        	catch(Exception ex)
            {
            	System.debug('Exception:Class__C:'+ex);            
            }
    }
    
    public void checkConstraintRules(List<class__c> clsLst)
    {
    	BusinessRuleUtil.getApplicableRuleList(clsLst,AllStaticConstants.obj_class);
    }
}