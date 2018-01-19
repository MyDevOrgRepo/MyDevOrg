public class myLeadController {

    public Lead lead{get;set;}
    public ID accid{get;set;}
    public account accdetails{get;set;}
    
    public void controller()
    {
        accid=ApexPages.currentPage().getParameters().get('id');
        System.debug('Account Id'+accid);
       accdetails=[select Phone from account where id=:accid limit 1];
      Contact pc = [select firstname,lastname,Phone,Email from contact where AccountId=:accid limit 1];
        
        lead = new Lead();
        lead.FirstName=pc.FirstName;
        lead.LastName=pc.LastName;
        lead.Phone=pc.Phone;
        lead.Email=pc.Email;
    }
    
    public void SaveLead()
    {
        //accid=ApexPages.currentPage().getParameters().get('id');
        Contact pc1 = [select firstname,lastname from contact where AccountId=:accid limit 1];
        
        //lead = new Lead();
        pc1.FirstName=lead.FirstName;
        pc1.LastName=lead.LastName;
        pc1.Phone=lead.Phone;
        pc1.Email=lead.Email;
    }
    
    
}