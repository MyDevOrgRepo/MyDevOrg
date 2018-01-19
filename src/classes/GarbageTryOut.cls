public class GarbageTryOut
{
    public boolean ShowCar{get;set;}
    public boolean SelectCar {get;set;}
    public vehicle__c vc{get;set;}
    public vehicle__c vc1{get;set;}
    public GarbageTryOut(ApexPages.StandardController controller)
    {
        vc = new vehicle__c();
        vc1 = new vehicle__c();
        SelectCar=false;
        ShowCar=true;
    
    }
    
    public PageReference showmultipicklist()
    {
    /*
    if(ShowCar==true)
    {
        SelectCar=true;
    }
    else if(ShowCar == false)
    {
        SelectCar=false;
    }
        vc.Show_Cars__c = ShowCar;
        vc1.show_cars__c=showcar;
    System.debug('ShowCar:'+ShowCar);
    System.debug('SelectCar:'+SelectCar);
      */  return null;
    }

}