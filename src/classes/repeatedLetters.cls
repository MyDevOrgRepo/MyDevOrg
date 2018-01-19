public class repeatedLetters {

    public void getRepeatedLetters(String str)
    {
        System.debug('String is:'+str);
        Map<String,Integer> m = new Map<String,Integer>();
       List<String> l = str.split(' ');
        System.debug(l);
        Iterator<String> it = l.iterator();
        String[] key = new String[str.length()];
        System.debug(str.length());
        Integer j=0;
        while(it.hasNext() && j<str.length())
        { Object o = it.next();
            System.debug(o);
            key[j]=String.valueOf(o);
         j++;
        }
        for(Integer i=0;i<str.length();i++)
        {                     
            
            if(m.containsKey(key[i]))
            {System.debug(key[i]);
                m.put(key[i], Integer.valueOf(m.get(key[i]))+1);
            }
            else
            {System.debug(key[i]);
                m.put(key[i],1);
            }
        }
        System.debug('Map Contents are:'+m);
        
       
    }
    
}