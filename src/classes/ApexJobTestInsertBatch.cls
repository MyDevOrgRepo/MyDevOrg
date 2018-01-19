global class ApexJobTestInsertBatch implements Database.Batchable<sObject>{
    String Query,Entity,Field,Value;
        //global ApexJobTestInsertBatch(String q, String e, String f, String v){
        //
	List<Opportunity> oppToAdd;
   // ApexJobTest insertjob  = new ApexJobTest();
    global ApexJobTestInsertBatch(List<opportunity> opp){
         
        /* Query=q; 
			oppToAdd = new List<Opportunity>();*/
        //oppToAdd = insertjob.insertOpp();
        oppToAdd =opp;
       }

      //global Database.QueryLocator start(Database.BatchableContext BC){
    global Iterable<sObject> start(Database.BatchableContext BC){
          //return Database.getQueryLocator(query);
return oppToAdd;
       }

        global void execute(Database.BatchableContext BC, List<sObject> scope){
              // Logic to be Executed batch wise      
			  /*date d = System.today();
            
              for(integer i=0;i<11000;i++) 

              {
					opportunity opp1 = new opportunity(name='opp'+i ,StageName='Prospecting',closedate=d,accountid='0012800000EdDsc');
						oppToAdd.add(opp1);
              }*/
            
            insert scope;
       }

       global void finish(Database.BatchableContext BC){

            // Logic to be Executed at finish

       }

 
}