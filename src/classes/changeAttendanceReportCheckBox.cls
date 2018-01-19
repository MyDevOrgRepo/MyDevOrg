global class changeAttendanceReportCheckBox implements Database.Batchable<sObject>
{
    
    global Database.QueryLocator start (Database.BatchableContext BC)
    {
        return Database.getQueryLocator('select attendance_reported__c from division__c');
    }
    
    global void execute(Database.BatchableContext BC, List<division__c>scope)
    {
        for(division__c div:scope)
        {
            div.attendance_reported__c = false;
        }
        
        if(scope.size()>0)
        {
            update scope;
        }
    }
    
    
    global void finish(Database.BatchableContext bc)
    {
    
    }
}