public class primeNumber {

    public Boolean isPrime(Integer num)
    {
        Boolean flag=false;
        Double sqrt=Math.sqrt(num);
        System.debug('Square root is:'+sqrt);
        if(num==1)
        {
            return true;
        }
        else
        {
        	for(Integer i=2;i<=sqrt;i++)
        	{
            	if(Math.mod(num, i)==0)
                {
                    System.debug('In IF');
                	flag=true;
                    break;
                }
        	}	
        }
        if(flag==false)
        {
            System.debug(num+' is prime...');
            return true;
        }
        else
        {
            System.debug(num+'is not prime...');
            return false;
        }
        return false;
    }
    
}