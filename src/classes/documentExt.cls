public class documentExt
{

public documentExt()
{

}

public String id{get;set;}
 /*
  public Document document {
    get {
      if (document == null)
        document = new Document();
      return document;
    }
    set;
  }
 
  public PageReference upload() {
id = ApexPages.CurrentPage().getParameters().get('id'); 
System.debug('Id is:'+id);
    document.AuthorId = UserInfo.getUserId();
    document.FolderId = UserInfo.getUserId(); // put it in running user's folder
 
 PageReference pr = new PageReference(System.Label.BaseOrgURL+id+'?inline=0');
      pr.setRedirect(true);
 
    try {
    System.debug('File Name:'+document.name);
            if(document.name.contains('.pdf'))
            {
                  insert document;
                   ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'File uploaded successfully'));
                   return pr;
            }
            else
            {
                document.addError('Please select PDF document only...');
                return null;
            }
    } catch (DMLException e) {
      ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Error uploading file'));
      return null;
    } finally {
      document.body = null; // clears the viewstate
      document = new Document();
    }
 
   
    return pr;
  }
*/


/* Attachment logic starts here */

//public with sharing class AttachmentUploadController {

  public Attachment attachment {
  get {
      if (attachment == null)
        attachment = new Attachment();
      return attachment;
    }
  set;
  }

  public PageReference upload() {

    id = ApexPages.CurrentPage().getParameters().get('id'); 

   
 
 PageReference pr = new PageReference(System.Label.BaseOrgURL+id+'?inline=0');
      pr.setRedirect(true);

    attachment.OwnerId = UserInfo.getUserId();
    attachment.ParentId = 'a0h28000001g4D3AAI'; // the record the file is attached to
    attachment.IsPrivate = true;

    try {
      insert attachment;
    } catch (DMLException e) {
      ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Error uploading attachment'));
      return null;
    } finally {
      attachment = new Attachment(); 
    }

    ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Attachment uploaded successfully'));
    return pr;
  }

}