public with sharing class EventTypeViewController
{

    public List<VendorBookingConfig__c> AvailableFlowsFromCustomSetting {get;set;}
    public List<String> availableWorkFlows{get;set;}
    public List<SelectOption> getAvailableFlowsFromCustomSetting{get;set;}
    public String selectedVendorType{get;set;}
    public List<SelectOption> optionsToSelect{get;set;}    
    public EventTypeViewController(ApexPages.StandardController controller) {
    optionsToSelect = new List<SelectOption>();
     getAvailableFlowsFromCustomSetting();   
    }

    public List<SelectOption> getAvailableFlowsFromCustomSetting()
    {
    
      List<VendorBookingConfig__c> vendorBookingConfigInfo = VendorBookingConfig__c.getAll().values();
    
        System.debug('vendorBookingConfigInfo>>'+vendorBookingConfigInfo);
         
        for(VendorBookingConfig__c vbcInfo:VendorBookingConfigInfo)
        {
            optionsToSelect.add(new SelectOption(vbcInfo.Flow_Name__c,vbcInfo.Flow_Name__c));
        }
    return optionsToSelect;
    }

}