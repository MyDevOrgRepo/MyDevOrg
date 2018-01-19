public class uploadSyllabus
{

    public class__c currentClass{get;set;}
    public String id{get;set;}
    public PageReference moveToUploadPage{get;set;}
    
    public uploadSyllabus(ApexPages.StandardController controller)
    {
        currentClass =(class__C) controller.getRecord();
    id = currentClass.id;
    }

    public PageReference moveToUploadPage()
    {
        PageReference pr = new PageReference(System.Label.ReDirectToUploadVFPage+id);
        pr.setRedirect(true);
        return pr;
        
    }
}