public class BorrowedBookTriggerHandler {

    public BorrowedBookTriggerHandler()
    {
        
    }
    
    public void validate(List<HeyLightning__Borrowed_Books__c> bbNew)
    {
        set<String> lstbkids = new set<String>();
        
        for(HeyLightning__Borrowed_Books__c bbids:bbNew)
        {
            lstbkids.add(bbids.book__c);
        }
        
        System.debug('Set is:'+lstbkids);
        List<HeyLightning__Borrowed_Books__c> bbExisting = [select book__c,book__r.HeyLightning__Number_of_copies__c from HeyLightning__Borrowed_Books__c where book__c=:lstbkids];
        System.debug('bbExisting is:'+bbExisting);
        
        Map<String,Decimal> allotedNoOfCopies = new Map<String,Decimal>();
        
        Map<String,integer> mapBkCount = new Map<String,integer>();
        
        for(HeyLightning__Borrowed_Books__c bbgetcnt:bbExisting)
        {
            System.debug('count:'+bbgetcnt.book__r.HeyLightning__Number_of_copies__c);
            	allotedNoOfCopies.put(bbgetcnt.book__c, bbgetcnt.book__r.HeyLightning__Number_of_copies__c);
            
					if(mapBkCount.containsKey(bbgetcnt.book__c))
                    {
                      mapBkCount.put(bbgetcnt.book__c,mapBkCount.get(bbgetcnt.book__c)+1);
                    }
					else
                    {
			            mapBkCount.put(bbgetcnt.book__c,1);
                    }    
        }
        System.debug('Map is:'+mapBkCount);
        
        	for(HeyLightning__Borrowed_Books__c bb:bbNew)
            {
                System.debug('mapBkCount.get(bb.book__c) = '+mapBkCount.get(bb.book__c));
                System.debug('bb.book__r.HeyLightning__Number_of_copies__c = '+allotedNoOfCopies.get(bb.book__c));
                System.debug('True or False :'+(mapBkCount.get(bb.book__c) < allotedNoOfCopies.get(bb.book__c)));
                if(mapBkCount.get(bb.book__c) < allotedNoOfCopies.get(bb.book__c))
                {
                    	System.debug('In if');
                    mapBkCount.put(bb.book__c,mapBkCount.get(bb.book__c)+1);
                }
                else 
                {
                    	System.debug('In Else');
                    bb.addError('No copies of this book are left to be given!!!');
                }
            }
    }
    
}