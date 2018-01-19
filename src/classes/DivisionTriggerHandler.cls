public class DivisionTriggerHandler {

    
    
    public DivisionTriggerHandler()
    {
        
    }
    
    public void checkDuplicate(List<Division__c> divlst)
    {
       			List<Class__C> classes = new List<Class__C>([select name from class__c]);
            	Map<id,String> classnames = new Map<id,String>();
            	List<Division__c> divisions = new List<Division__C>([select name,class__C from division__C]);
            	
            	Map<String,List<String>> cls_div_map = new Map<String,List<String>>();
            	           
            	for(Class__c cls:classes)
                {
                    classnames.put(cls.Id, cls.Name);
                    List<String> associated_divs = new List<String>();
                    for(Division__C divs:divisions)
                    {
                        if(divs.class__c==cls.id)
                        {
                            associated_divs.add(divs.Name);
                        }
                    }
                    cls_div_map.put(cls.id, associated_divs);
                }
            
            for(Division__c divs:divlst)
            {
                if(cls_div_map.containsKey(divs.class__c))
                {
                    List<String> associated_divs = cls_div_map.get(divs.class__c);
                    for(String div:associated_divs)
                    {
                        if(div==divs.name)
                        {
                            divs.addError('Can not add duplicate division for same class '+classnames.get(divs.class__c));
                        }
                    }
                }
            }
            
    }
    
}