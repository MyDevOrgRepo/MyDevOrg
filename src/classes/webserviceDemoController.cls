public class webserviceDemoController {

    public String val{get;set;}
    public String submitButton{get;set;}
    /*webserviceDemoController()
    {
        getval();
    }*/
        
    
    public void getval()
    {
        val=webServiceDemo.helloWorld();
        
    }
      
    
}