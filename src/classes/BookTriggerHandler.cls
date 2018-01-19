public class BookTriggerHandler {

    	public BookTriggerHandler()
        {
            
        }
    
    
    	public void validate(List<HeyLightning__Book__c> existingBooks)
        {
            List<String> bookids = new List<String>();
            for(HeyLightning__Book__c bbids : existingbooks)
            {
                bookids.add(bbids.id);
            }
            
        	List<HeyLightning__Borrowed_Books__c> bbExisting = [select book__c,book__r.HeyLightning__Number_of_copies__c from HeyLightning__Borrowed_Books__c where book__c=:bookids];
           Map<String,integer> mapBkCount = new Map<String,integer>();
            for(HeyLightning__Borrowed_Books__c bbgetcnt:bbExisting)
            {
                               
                        if(mapBkCount.containsKey(bbgetcnt.book__c))
                        {
                          mapBkCount.put(bbgetcnt.book__c,mapBkCount.get(bbgetcnt.book__c)+1);
                        }
                        else
                        {
                            mapBkCount.put(bbgetcnt.book__c,1);
                        }    
            }
            
            for(heylightning__book__c bk :existingBooks)
            {
                if(bk.HeyLightning__Number_of_copies__c < mapBkCount.get(bk.Id))
                {
                    bk.addError('No. of copies cannot be less than no. of books already given. Please free the books given and try again.');
                }
            }
        }
    
}