public with sharing class OppOverride {

List<Price_Plan__C> mypriceplans{get;set;}

    public OppOverride(ApexPages.StandardController controller) {

    mypriceplans=[select name from price_plan__c];

    }
    
    

}