public with sharing class MyAnalyticsController
{

    List<Opportunity> opp{get;set;}
    
    public MyAnalyticsController()
    {
    
        opp = new List<Opportunity>();
    }
    
    public List<opportunity> getopps()
    {
        opp = [select probability from opportunity];
        return opp;
    }
    
    
}