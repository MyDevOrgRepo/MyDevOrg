trigger no_name_modification on DummyObject__c (before update) {

    if(Trigger.isUpdate)
    {	/*original class*/
       dummy_name_no_modification dnnm =  new dummy_name_no_modification(Trigger.new);
       dnnm.no_name_modification();
       
      //  dummy_name_no_modification_test dnnm =  new dummy_name_no_modification_test(Trigger.new);
        /*test class*/
   //     dummy_name_no_modification_test.insertData();
    //    dummy_name_no_modification_test.updateData();
    //   dummy_name_no_modification_test.no_name_modification();
    }
}