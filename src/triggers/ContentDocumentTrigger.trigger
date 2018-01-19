trigger ContentDocumentTrigger on ContentDocumentLink (before update,after Update) {

   /*******************************Before Update*********************/

    if(Trigger.isBefore)
    {
        System.debug('In Before');
        if(Trigger.isUpdate)
        {
        
            for(contentDocumentLink cdl:Trigger.new)
            {
            
                        System.debug('Before Update:id is:'+cdl.id);
                        System.debug('BeforeUpdate:LinkedEntityId is:'+cdl.LinkedEntityId);
            
            }
        
        }
    }
    
  /************************After Update*********************/
  
  if(Trigger.isAfter)
    {
    System.debug('In After');
        if(Trigger.isUpdate)
        {
        
            for(contentDocumentLink cdl:Trigger.new)
            {
            
            
                        System.debug('After Update:id is:'+cdl.id);
                        System.debug('After Update:LinkedEntityId is:'+cdl.LinkedEntityId);
            
            }
        
        }
    }
    
    
    
  
    

}