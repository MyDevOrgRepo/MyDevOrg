@isTest //(seealldata=true)
public class test_class_not_more_than_2_pos {

    
    public static testMethod void test_no_more_than_2_pos()
    {
        
        candidate__c candi = new Candidate__c(first_name__c='nilesh',current_employer__c='false',ssn__c='123456789');
        insert candi;
            integer count=0;
        	for(integer i=0;i<2;i++)
        	{
         		Job_Application__c ja= new Job_Application__c(Candidate__c=candi.Id);
        		//ja.Candidate__c=candi.Id;
        		System.debug('Cadidate is:'+ja.Candidate__c);
        		insert ja;
				count++;        
                
        	}
        AggregateResult cnt=[select count(candidate__r.name) total from job_application__c where candidate__r.first_name__c='nilesh'];
        //System.debug('Total is:'+(Integer)cnt.get('total'));
            System.assertEquals(2,(Integer)cnt.get('total'));
        }
    //}
    
}