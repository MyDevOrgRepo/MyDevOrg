global class Schedule_All_Batchable_Jobs implements Schedulable
{
    
    public Schedule_All_Batchable_Jobs()
    {
    
    }
    
    global void execute(SchedulableContext sc)
    {
        System.schedule('Schedule Lead_Distribution', '0 5 * * * ?', new Lead_Distribute_Schedular());
    }

}