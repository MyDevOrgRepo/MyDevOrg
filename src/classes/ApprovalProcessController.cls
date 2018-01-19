public with sharing class ApprovalProcessController {
    
    vendor__c vendor ;
    
    public ApprovalProcessController(ApexPages.StandardController controller)
    {
    	vendor = (Vendor__c)controller.getREcord();
    	 	//submitForApproval(vendor.id);
    }
    
    public PageReference submitForApproval()
    {
    	PageReference pr = new PageReference('/'+vendor.Id);
    	
    	Approval.ProcessSubmitRequest req1 = new Approval.ProcessSubmitRequest();
		req1.setComments('Submitting request for approval.');
		req1.setObjectId(vendor.Id);

		        // Submit the approval request for the interaction
		        Approval.ProcessResult result = null;
		        try{
		        	    result = Approval.process(req1);
			            if(result.isSuccess()){
			            	System.debug('Vendor record successfully submitted for approval...');
			            }else{
			                List<Database.Error> errorList = result.getErrors();
			                String returnMessage = '';
			                for(Database.Error e: errorList){
			                    returnMessage += e.getMessage() + '\n';
			                }
			                System.debug('Error Message List>>'+returnMessage);
		        		}
		       
		        }catch(Exception e){
		            String msg = e.getMessage();
		            msg = msg.replace('Process failed. First exception on row 0; first error:', '');
		            msg = msg.replace(': []', '');
		        }
    	return pr;
    }
    
    
}