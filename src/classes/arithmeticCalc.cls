public class arithmeticCalc {
    
    public Integer addNums(Integer num1,Integer num2)
    {
        return num1+num2;
    }
    
    
    public Integer subNums(Integer num1,Integer num2)
    {
        return num1-num2;
    }
    
    public Integer multNums(Integer num1,Integer num2)
    {
        return num1*num2;
    }
    
    
    public Double divNums(Integer num1,Integer num2)		
    {
        try
        {
        /*	if(num2==0)
            {
                return 0;
            }
        	else
            {*/
                return num1/num2;
            //}
        }
        catch(Exception e)
        {
            System.debug('Error'+e);
        }
        return 0;
    }
    
}