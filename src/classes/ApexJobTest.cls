public class ApexJobTest {
    
    Account acc;
   Opportunity opp ;
    List<Opportunity> opplist = new List<Opportunity>();
    public ApexJobTest()
    {
    acc = new account();    
        
    }

    
    /* older version
    public void insertOpp()
    {
        date d = System.today();
        for(integer i=0;i<11000;i++)
        {
    		opp = new opportunity(stagename='Prospecting',name='Myopp-'+i,closedate=d,accountid='0012800000E9HM2');        
            opplist.add(opp);
        }
        insert opplist;
    }*/
    
    public List<Opportunity> insertOpp()
    {
        date d = System.today();
        for(integer i=0;i<11000;i++)
        {
    		opp = new opportunity(stagename='Prospecting',name='Myopp-'+i,closedate=d,accountid='0012800000E9HM2');        
            opplist.add(opp);
        }
        return opplist;
       // insert opplist;
    }
    
    
    
    
}