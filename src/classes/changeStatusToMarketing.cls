global class changeStatusToMarketing implements Database.Batchable<SObject>
{
    global Database.QueryLocator start (Database.BatchableContext Bc)
    {
        return Database.getQueryLocator('select id,status from Lead where status=\'New\' or status=\'Working On\' ');
    }
    
    global void execute(Database.BatchableContext Bc,List<Lead> leads)
    {
        List<Lead> leadsToUpdate = new List<Lead>();
    
        for(Lead l:leads)
        {
            l.status='Marketing';
            leadsToUpdate.add(l);
        }
        update leadsToUpdate;
    }
    
    global void finish(Database.BatchableContext BC)
    {
        
    }
}