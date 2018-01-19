trigger ContactTrigger on Contact (After Insert,After Update) {


        ContactTriggerHelper cth = new ContactTriggerHelper();

        if(Trigger.isBefore)
        {
               if(Trigger.isInsert) 
               {
               
               }
               
               if(Trigger.isUpdate) 
               {
               
               }
        }
       if(Trigger.isAfter)
       {
               if(Trigger.isInsert) 
               {
               
                cth.updateaccount(Trigger.new);      
               }
               
               if(Trigger.isUpdate)
               {
               cth.updateaccount(Trigger.new);
               }
       }

}