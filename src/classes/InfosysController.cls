public with sharing class InfosysController {

    public Boolean renderEntirePage { get; set; }
    public  Boolean showStudent{get;set;}
    public List<HeyLightning__Student__c> getStudents{get;set;}
    public List<HeyLightning__Student__c> stds {get;set;}
    

        public HeyLightning__Student__c std{get;set;}

        public InfosysController()
        {
            System.debug('In Constructor');
                    std = new HeyLightning__Student__c();
                    showStudent=false;
        }
        
       public List<HeyLightning__Student__c> getStudents()
       {
           
           stds=[select HeyLightning__Class__r.name,HeyLightning__first_name__c,HeyLightning__last_name__c,HeyLightning__Date_of_Birth__c,HeyLightning__email__c,HeyLightning__phone__c,HeyLightning__Division__c from HeyLightning__Student__c where HeyLightning__Class__c=:std.HeyLightning__Class__c];
           showStudent=true;
           System.debug('In getStudents');
           return stds;
       }
        
}