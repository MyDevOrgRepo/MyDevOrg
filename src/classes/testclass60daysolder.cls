@isTest
public class testclass60daysolder {

    public static testmethod void testLEad()
    {
        DateTime dt= System.now().addDays(-59);
        Lead l = new Lead(company='mycomp',firstname='rohit',lastname='joshi',status='New',email='rrjoshi12@gmail.com',phone='987654321');
        insert l;
        Test.setCreatedDate(l.id, dt);
        Lead l1 = new Lead(company='mycomp1',firstname='rohit1',lastname='joshi1',status='New',email='rrjoshi89@gmail.com',phone='1234567890');
        insert l1;
        
        List<Lead> l2 =[select createddate,email from lead where email='rrjoshi89@gmail.com' or email='rrjoshi12@gmail.com'];
        
        System.debug('old date:'+l2[0].CreatedDate);
        System.debug('email l2[0]'+l2[0]);
        System.debug('New date:'+l2[1].CreatedDate);
        System.debug('email l2[1]'+l2[1]);
        //System.assertEquals(l.CreatedDate, dt);
        //System.assertEquals(l1.CreatedDate, System.now());
        System.assertEquals(l2[0].CreatedDate<l2[1].CreatedDate.addDays(-60),true);
    }
    
}