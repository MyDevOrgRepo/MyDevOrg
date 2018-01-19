trigger AccountTrigger on Account (before insert,after insert) {

public static List<Account> acc = new List<Account>();
public List<Contact> cons = new List<Contact>();

    if(Trigger.isBefore)
    {
        if(Trigger.isInsert)
        {
        
            }
     }
            
            
            if(trigger.isAfter)
            {
            
                if(Trigger.isInsert)
                {
                        System.debug('In after');
                        integer i=1;
                       acc = [select id,name,noofcontact__c from account where createddate=today order by createddate desc limit 1];
                       System.debug('Acc list:'+acc);
                        for(Account acc1:acc)
                        {System.debug('In for above');
                            for(integer j=0;j<acc1.noofcontact__C;j++)
                            {
                                System.debug('In for');
                                Contact con = new Contact();
                                con.accountid=acc1.id;
                               // System.debug('String'+accname);
                                con.firstname=acc1.name+':'+i;
                                con.lastname=acc1.name+':'+i;
                                cons.add(con);
                            }                     
                        }
                        insert cons;
                }
             
        /*
            System.debug('Hi');
            try
            {
                
            }   
            catch(Exception ex)//System.DmlException ex)
            {System.debug('Error: in DML Exception');
             /*
                List<Error_Records__c> ercc = new List<Error_Records__c>();
                for(integer i=0;i<ex.getNumDml();i++)
                {
                    Error_Records__c er = new Error_Records__c(Name=ex.getDmlId(i),ErrorDetails__c=(String) ex.getDmlMessage(i));
                    ercc.add(er);
                }
                insert ercc;*/
            /*}
            */
            
        }
        
    }