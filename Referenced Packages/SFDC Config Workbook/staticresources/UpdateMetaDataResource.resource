PK
     ɚ5G�"�*�  �     app.js 
 $(document).ready(function(){
     updateButton();
 });
 
 function init() {
    // $('input[id$="switch-size"]').bootstrapSwitch();
     $('input.chk').bootstrapSwitch();
     if($('.UpdatedClass').length<=0){
       $('.update').attr('disabled','true');  
     }
     $('input[id$="switch-size"]').on('switchChange.bootstrapSwitch', function(event, state) {
         changeValue(this, state, true);
         updateButton(this);
     });

     $("input.change").change(function() {
         changeValue(this, null, false);
         updateButton(this);  
     });
    $('textarea.change').on('change keyup paste', function() {
         changeValue(this, null, false);
         updateButton(this);  
    });

 }
  
  function updateButton(object){
      if($('.UpdatedClass').length<=0){
       $('.update').attr('disabled','disabled');  
     }else{
         $('.update').removeAttr('disabled');  
     }
     
     var obj = $(object).closest('tr').find('input.updated');
        
     if($('.UpdatedClass').length<=0){
          $(obj).prop('checked', false);
     }else{
       $(obj).prop('checked', true);  
     }      
     
  }

 function showMySelection(object){ 
    if($('.UpdatedrowClass').length>0){
       $("tr.rowdetail" ).not(".UpdatedrowClass" ).hide();
       $(object).hide();
       $('.Allbtn').show();
     } else{
         bootbox.alert("You have not updated any row(s).", function() {
  
         });
     }
 }

 function showAllValue(object){
     $("tr.rowdetail" ).show();
     $(object).hide();
     $('.showbtn').show();
  }

 function changeValue(object, state, checkboxchange) {
     if (!$(object).hasClass('chk') && $(object).data('oldvalue') != $(object).val()) {
         $(object).closest('td').addClass('UpdatedClass');
         $(object).closest('tr').addClass('UpdatedrowClass');
     }else if (!checkboxchange) {
        $(object).parent('td').removeClass('UpdatedClass');
         $(object).parent('td').parent('tr').removeClass('UpdatedrowClass');
      }     
     
     if (checkboxchange && $(object).hasClass('chk') && $(object).data('oldvalue2') != state) {
           $(object).closest('td').addClass('UpdatedClass');
           $(object).closest('tr').addClass('UpdatedrowClass');
         } else if (checkboxchange) {
            $(object).parent().parent().parent('td').removeClass('UpdatedClass');
            $(object).parent().parent().parent('td').parent('tr').removeClass('UpdatedrowClass');
        }
     
     /*if ($(object).closest().data('oldvalue') != state) {
         var obj = $(object).closest('tr').find('input.updated');
         $(obj).prop('checked', false);
         $("input.change", $(object).closest('tr')).each(function(index) {
             if (!$(this).hasClass('chk') && $(this).data('oldvalue') != $(this).val()) {
                 $(obj).prop('checked', true);
                 $(this).closest('td').addClass('UpdatedClass');
             } else if (!checkboxchange) {
                $(this).parent('td').removeClass('UpdatedClass');
             }
             if (checkboxchange && $(this).hasClass('chk') && $(this).data('oldvalue2') != state) {
                 $(obj).prop('checked', true);
                 $(this).closest('td').addClass('UpdatedClass');
             } else if (checkboxchange) {
                 $(this).parent().parent().parent('td').removeClass('UpdatedClass');
             }
         });
     }*/
 }
PK 
     ɚ5G�"�*�  �                   app.jsPK      4   �    