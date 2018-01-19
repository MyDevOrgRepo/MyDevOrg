public class TimeTableTriggerHandler {

   
    List<HeyLightning__TimeTable__c> allrecords;
    public TimeTableTriggerHandler()
    {
        allrecords = new List<HeyLightning__TimeTable__c>();
    }
    
    public List<HeyLightning__TimeTable__c> getExistingRecords()
    {
        allrecords = [select name,HeyLightning__day__c,HeyLightning__class__c,HeyLightning__class__r.name,HeyLightning__division__c,HeyLightning__division__r.name,HeyLightning__startTime1__c,HeyLightning__startTime2__c,HeyLightning__startTime3__c,
                     HeyLightning__startTime4__c,HeyLightning__startTime5__c,HeyLightning__startTime6__c,
                     HeyLightning__endTime1__c,HeyLightning__endTime2__c,HeyLightning__endTime3__c,HeyLightning__endTime4__c,
                     HeyLightning__endTime5__c,HeyLightning__endTime6__c,HeyLightning__teacher1__c,HeyLightning__teacher2__c,
                     HeyLightning__teacher3__c,HeyLightning__teacher4__c,HeyLightning__teacher5__c,HeyLightning__teacher6__c,
                     HeyLightning__subject1__c,HeyLightning__subject2__c,HeyLightning__subject3__c,HeyLightning__subject4__c,
                     HeyLightning__subject5__c,HeyLightning__subject6__c from HeyLightning__TimeTable__c];
        return allrecords;
    }
    
    public void checkDuplicates(List<HeyLightning__TimeTable__c> ttlstnew)
    {
     List<HeyLightning__TimeTable__c> ttlst = new List<HeyLightning__TimeTable__c>();
        ttlst = ttlstnew;
        for(HeyLightning__TimeTable__c tt:ttlst)
        {
            for(HeyLightning__TimeTable__c allrecs: allrecords)
            {
                if(tt.HeyLightning__Division__c==allrecs.HeyLightning__Division__c &&
                  tt.HeyLightning__Class__c==allrecs.HeyLightning__Class__c 	&&
                  tt.HeyLightning__Day__c==allrecs.HeyLightning__Day__c
                  )
                {
                    tt.addError('Time Table for class '+allrecs.HeyLightning__class__r.name+' and Division '+allrecs.HeyLightning__Division__r.name+' for day '+allrecs.HeyLightning__Day__c+' already exists');
                }
            }
        }
    }
    
}