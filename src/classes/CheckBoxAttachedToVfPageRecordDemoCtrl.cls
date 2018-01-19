public with sharing class CheckBoxAttachedToVfPageRecordDemoCtrl {
 
 //Page Members
 public  String selectedObject{get;set;}
 public  List<SelectOption> selectedObjectLst{get;set;}
 public  PageReference getSobjectrecords{get;set;}
 public  List<sObject> selsectedObjectRecords{get;set;}
 public  String fieldList{get;set;}
 public  List<String> fieldListLSt{get;set;}
 public  List<AddSeriesWrapper> wrapperList {get;set;}
 public String wrappedLst{get;set;}
 public static set<id> processWrapper{get;set;}
 
 //Class Members
 public  Map<String,Schema.SObjectType> fieldApiObjectTypeMap;
 public  Map<String, Schema.SObjectType> fieldNameSOjectTypeMap;
     public CheckBoxAttachedToVfPageRecordDemoCtrl()
     {
     	System.debug('In Constructor>>');
         //Initializations
         selectedObjectLst = new List<SelectOption>();
         fieldApiObjectTypeMap = new Map<String,Schema.SObjectType>(); 
         fieldNameSOjectTypeMap = new Map<String,Schema.SObjectType>();
          
         getSelectedObjecLst();
  		wrapperList = new List<AddSeriesWrapper>();  
     }
     
     public  List<SelectOption> getSelectedObjecLst()
     {
         fieldNameSOjectTypeMap = Schema.getGlobalDescribe();
         for(Schema.sObjectType obj : fieldNameSOjectTypeMap.values())
         {
             System.debug('obj>>'+obj);
             Schema.DescribeSObjectResult result = obj.getDescribe();
             selectedObjectLst.add(new SelectOption(result.getName(),result.getLabel()));
            // fieldApiObjectTypeMap.put(result.getName(),result.getSobjectType);    
             System.debug('result.getName()>>'+result.getName());
             System.debug('result.getLabel()>>'+result.getLabel());
         }
         
         return selectedObjectLst; 
     }
     
     
     public PageReference getSobjectrecords()
     {
     	try
     	{
		     System.debug('selectedObject>>getSobjectrecords'+selectedObject);
		     Schema.SobjectType sObjectType =  fieldNameSOjectTypeMap.get(selectedObject);
		     String objectname = fieldNameSOjectTypeMap.get(selectedObject).getDescribe().getName();
		     fieldList = new AllDataSelector().getSObjectFields(String.valueOf(sObjectType));
		     fieldListLSt = fieldList.split(',');
		     string query = 'select '+fieldList+' from '+sObjectType;
		     System.debug('Query is>>'+query);
		     //List<objectname> demolst = new List<objectname>();
		     selsectedObjectRecords =  Database.query(query);
		     for(sObject sObjectEntry:selsectedObjectRecords)
		     {
		     AddSeriesWrapper newWrapper = new AddSeriesWrapper();
		     	newWrapper.isSelect=false;
		     	newWrapper.sObjectWrapper = sObjectEntry;
		     	wrapperList.add(newWrapper);
		     }
		     System.debug('selsectedObjectRecords>>'+selsectedObjectRecords);
		     
		     return null;
     	}
     	catch(Exception e)
     	{
     		ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,e.getMEssage()));
     	}
     	return null;
     }
    
    @RemoteAction
    public static set<id> processWrapper(String wrapper)
   {
   	set<id> recordIdSet = new set<id>();
   	List<AddSeriesWrapper> wrapperFromScript = new List<AddSeriesWrapper> ();
   	System.debug('wrapperList>>Before>>'+wrapper);
   	//wrappedLst = JSON.serialize(wrapperList);
   	for(AddSeriesWrapper asw:wrapperFromScript)
   	{
   		if(asw.isSelect==true)
   		{
   			recordIdSet.add(asw.sObjectWrapper.id);
   		}
   	}
   	//System.debug('wrapperList>>'+wrappedLst);
	System.debug('recordIdSet>>'+recordIdSet);
	return recordIdSet;
   }
    
     public with sharing class AddSeriesWrapper {
        public SObject sObjectWrapper{get; set;}       
        public Boolean isSelect {get; set;}
        public AddSeriesWrapper (){    
        }
    }
    
    
}