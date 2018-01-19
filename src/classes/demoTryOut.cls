public class demoTryOut
{
   /* public book__c bk{get;set;}

    public demoTryOut(apexPages.StandardController controller)
    {
            bk=(book__c)controller.getRecord();
            
            System.debug('BK is:'+bk);
        
    }*/
    
    public String id{get;set;}
    public List<ContentDocumentLink> cdlst{get;set;}
    public demoTryOut(apexPages.StandardController controller)
    {
            vehicle__c vc = (Vehicle__c) controller.getRecord();
            id = apexpages.currentPage().getParameters().get('id');
            showNotes();
    
    } 
    
    public PageReference showNotes()
    {
    
        cdlst = [select id,contentDocument.Title,contentDocument.ContentModifiedDate,contentDocument.sharingOption,isDeleted,sharetype,SystemModStamp,visibility from ContentDocumentLink where LinkedEntityId=:id];
    
        return null;
    
    }
    
    
}