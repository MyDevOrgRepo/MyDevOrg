global class moveLeadsToPurgeQueue implements Database.Batchable<SObject>
{
    global Database.QueryLocator start (Database.BatchableContext Bc)
    {
        return Database.getQueryLocator('select id,CreatedDate from Lead where CreatedDate<Last_N_days:60');
    }
    
    global void execute(Database.BatchableContext Bc,List<Lead> leads)
    {
        List<Lead> leadsToMove = new List<Lead>();
    
        for(Lead l:leads)
        {
            l.ownerid=System.Label.Purge_Queue;
            leadsToMove.add(l);
        }
        update leadsToMove;
    }
    
    global void finish(Database.BatchableContext BC)
    {
    
    }
}