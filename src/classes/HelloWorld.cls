public class HelloWorld {
	Static integer i;
    public static void sayYou(){
        System.debug('You');
      
    System.debug(i);
        
    }
    
    public void sayMe()
    {
        Position__c p = [select name from position__c where name like 'j%'];
		System.debug('Position Title:'+p.name);
        System.debug('Me');
        
    }    
}