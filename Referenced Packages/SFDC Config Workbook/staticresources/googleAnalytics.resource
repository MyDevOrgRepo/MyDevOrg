PK
     �tG�,0|�  �     googleAnalytics.js
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  //ga('send', 'pageview');

/*ga('send', {
  'hitType': 'event',          // Required.
  'eventCategory': 'link',   // Required.
  'eventAction': 'click',      // Required.
  'eventLabel': 'Btn',
  'eventValue': 4
});

*/
$(document).ready(function(){
 ga('create', 'UA-53649289-3',{'userId': gaDetail}, 'auto', {'alwaysSendReferrer': true});
 ga('require', 'displayfeatures');
 ga('set', 'dimension1', gaDetail); 
 ga('set', 'contentGroup1', 'Flow');  
 ga('send', 'pageview');
 
 $('.ga').on('click', function() {
      ga('send', 'event', 'link', 'click', ''+$(this).data('action'));
    });
});
PK
     �|G�-���  �     RemoteSite.jsfunction createRemoteSite(host,sessionid,remoteSiteName)
{
    // Disable button
    //document.getElementById('createremotesitebtn').disabled = true;
    // Calls the Metdata API from JavaScript to create the Remote Site Setting to permit Apex callouts
    var binding = new XMLHttpRequest();
    var request =
        '<?xml version="1.0" encoding="utf-8"?>' +
        '<env:Envelope xmlns:env="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">'+
            '<env:Header>' +
                '<urn:SessionHeader xmlns:urn="http://soap.sforce.com/2006/04/metadata">' +
                    '<urn:sessionId>'+sessionid+'</urn:sessionId>' +
                '</urn:SessionHeader>' +
            '</env:Header>' +
            '<env:Body>' +
                '<createMetadata xmlns="http://soap.sforce.com/2006/04/metadata">' +
                    '<metadata xsi:type="RemoteSiteSetting">' +
                        '<fullName>'+remoteSiteName+'</fullName>' +
                        '<description>Metadata API Remote Site Setting for CWB Tool</description>' +
                        '<disableProtocolSecurity>false</disableProtocolSecurity>' +
                        '<isActive>true</isActive>' +
                        '<url>'+host+'</url>' +
                    '</metadata>' +
                '</createMetadata>' +
            '</env:Body>' +
        '</env:Envelope>';
    binding.open('POST', 'https://'+window.location.host+'/services/Soap/m/31.0');
    binding.setRequestHeader('SOAPAction','""');
    binding.setRequestHeader('Content-Type', 'text/xml');
    binding.onreadystatechange =
        function() {
            if(this.readyState==4) {
                var parser = new DOMParser();
                var doc  = parser.parseFromString(this.response, 'application/xml');
                var errors = doc.getElementsByTagName('errors');
                var messageText = '';
                for(var errorIdx = 0; errorIdx < errors.length; errorIdx++)
                    messageText+= errors.item(errorIdx).getElementsByTagName('message').item(0).innerHTML + '\n';
                displayRemoteSiteResponse(messageText);
            }
        }
    binding.send(request);
}PK
     x�Gee0�i  i     jqueryTabCustomStyle.css#cwbtooljq body,#cwbtooljq td,#cwbtooljq .ui-wdget,#cwbtooljq .ui-widget table{font-family:Arial,Helvetica,sans-serif;}#cwbtooljq body tr,#cwbtooljq td tr,#cwbtooljq .ui-wdget tr,#cwbtooljq .ui-widget table tr{border-bottom:0}#cwbtooljq body .bEditBlock .pbBody{overflow:auto}#cwbtooljq body .pbBody table.list tr.headerRow td,#cwbtooljq body .pbBody table.list tr.headerRow th{background:#ccc}#cwbtooljq button:focus,#cwbtooljq input[type=button]:focus,#cwbtooljq input:focus,#cwbtooljq a:focus{outline:0 !important}#cwbtooljq button:active,#cwbtooljq input[type=button]:active,#cwbtooljq input:active,#cwbtooljq a:active{outline:0 !important}#cwbtooljq form .btn{border-radius:4px}#cwbtooljq .margin-left{margin-left:10px}#cwbtooljq .label-right{text-align:right;width:100%;display:block;color:#555}#cwbtooljq #tabs .signoffText{display:block;float:none}#cwbtooljq .contentBody .row,#cwbtooljq .headercontainer .row,#cwbtooljq .rbscontainer .row{margin:0}#cwbtooljq #tabs .rbscontainer .row{border-bottom:1px solid #eee}#cwbtooljq .custombreadcrumb{background-color:#eee}#cwbtooljq .custombreadcrumb li{line-height:180%;width:20%}#cwbtooljq .custombreadcrumb li a{padding:15px 0 15px 55px;width:100%;color:#555;line-height:100%}#cwbtooljq .custombreadcrumb li a .step{font-size:10px;font-weight:100;font-family:arial, sans-serif;display:block;text-transform:uppercase}#cwbtooljq .custombreadcrumb li a:before{border-left:30px solid #fff}#cwbtooljq .custombreadcrumb li:first-child a{padding-left:20px}#cwbtooljq .custombreadcrumb li:last-child a{padding-right:20px;border-radius:0 4px 4px 0}#cwbtooljq .custombreadcrumb li.progressstage,#cwbtooljq .custombreadcrumb li.inactive{background:#eee}#cwbtooljq .custombreadcrumb li.progressstage a,#cwbtooljq .custombreadcrumb li.inactive a{line-height:180%;color:#222}#cwbtooljq .custombreadcrumb li.progressstage a:hover,#cwbtooljq .custombreadcrumb li.inactive a:hover{text-decoration:none}#cwbtooljq .custombreadcrumb li.progressstage a:after,#cwbtooljq .custombreadcrumb li.inactive a:after{border-left:30px solid #eee}#cwbtooljq .custombreadcrumb li.progressstage{background:#3D7FCD}#cwbtooljq .custombreadcrumb li.progressstage a{color:#ffffff}#cwbtooljq .custombreadcrumb li.progressstage a:after{border-left:30px solid #3D7FCD}#cwbtooljq .custombreadcrumb li.inactive a{color:#777}#cwbtooljq .help,#cwbtooljq .intro{margin:0 auto;text-align:center}#cwbtooljq .help p,#cwbtooljq .intro p{font-size:15px;margin-bottom:25px}#cwbtooljq .help h4,#cwbtooljq .intro h4{margin-bottom:15px;display:block}#cwbtooljq .help{border-top:1px solid #eee;padding-top:2.5em}#cwbtooljq .test-data{margin-top:1px;margin-left:15px}#cwbtooljq .successIcon{border-radius:40px;padding:6px;background-color:#5cb85c}#cwbtooljq .actionsec{float:right;position:absolute;right:30px;top:145px}#cwbtooljq .actionsec .prev{margin-right:15px}#cwbtooljq .actionsec.bottom{bottom:30px;top:auto;position:relative;width:98%;display:block;background:#eee;padding:12px;border-radius:4px;margin-top:5em}#cwbtooljq .actionsec.bottom .row{float:right}#cwbtooljq .rbscontainer .header,#cwbtooljq .playtypelist .header{background-color:transparent;height:auto;width:100%;margin:10px auto;display:block;font-family:Arial,Helvetica,sans-serif;padding:10px 10px 0px 0;overflow:auto;border-bottom:3px solid #eee}#cwbtooljq .rbscontainer .header p,#cwbtooljq .playtypelist .header p{color:#777;font-weight:normal;font-size:16px}#cwbtooljq .rbscontainer .header .description p,#cwbtooljq .playtypelist .header .description p{font-size:16px;max-width:800px;margin-left:auto;margin-right:auto}#cwbtooljq .headercontainer .message{margin:0}#cwbtooljq .playtypelist .header{width:100%}#cwbtooljq .playtypelist{float:none;width:98%;display:block;margin:0 auto;clear:both}#cwbtooljq .ui-widget-content{border:0;font-family:arial, sans-serif}#cwbtooljq .ui-corner-all,#cwbtooljq .ui-corner-bottom,#cwbtooljq .ui-corner-left,#cwbtooljq .ui-corner-bl{border-radius:0}#cwbtooljq .ui-widget-header{background:#ffffff;border:0;border-bottom:1px solid #eee;padding:10px 10px 0 10px}#cwbtooljq .ui-tabs .ui-tabs-nav li{background:#fff;margin-right:.5em}#cwbtooljq #tabs li,#cwbtooljq #tabs li a{color:#3D7FCD;font-family:arial, sans-serif;border:0;border-bottom:0}#cwbtooljq #tabs li.ui-state-active .ui-tabs-anchor,#cwbtooljq #tabs li a.ui-state-active .ui-tabs-anchor{border:1px solid #eee;border-radius:4px 4px 0 0;color:#555;border-bottom:0}#cwbtooljq #tabs li:hover,#cwbtooljq #tabs li:focus,#cwbtooljq #tabs li a:hover,#cwbtooljq #tabs li a:focus{text-decoration:none;background:#eee;border-radius:4px 4px 0 0}#cwbtooljq #tabs li a{padding:1.2em}#cwbtooljq #tabs .lbl{font-size:13px;color:#555}#cwbtooljq .ui-tabs .ui-tabs-nav .ui-tabs-anchor{border:1px solid #eee;color:#555}#cwbtooljq .pbTitle{width:50%}#cwbtooljq .pbTitle h2{color:#555;font-size:22px}#cwbtooljq .bPageBlock{border:0}#cwbtooljq .bPageBlock .pbBody{background:#fff;overflow:auto;margin:0}#cwbtooljq .pbBottomButtons{margin-top:0;border:0;padding-top:3em;background:#ffffff}#cwbtooljq .Custom108Tab .bPageBlock{border-top:0}#cwbtooljq .rbscontainer .description{font-family:arial, sans-serif;font-weight:100;max-width:800px;margin:0 auto 2em}#cwbtooljq .rbscontainer .description p{font-size:15px;margin:0 0 5px}#cwbtooljq .agree{border-top:1px solid #eee;border-botom:1px solid #eee;padding:23px 0;margin-bottom:2em}#cwbtooljq .launch h4{display:block;margin-bottom:1em}#cwbtooljq .launch .btn-lg{margin-right:15px}PK
     |�)GY���  �     jquery-DynamicModal-1.1.0.jsvar options;
(function ($) {
   
	
    $.fn.DynamicModal = function (option) {
	    options=option;
        this.click(function (e) {
		  options=option;
		  //openDynamicModal(this); 
		  e.preventDefault();
		});
	};
	})(jQuery); 
    
     function openDynamicModal(domObj,selectlist,selectedValue){  
        options = $.extend({
                Confirm: "Yes",
                Cancel: "No",
                ModelName: "#dymanicModal",
                Title: "Confirm",
                Text: "Are you sure?",
                OK: function (data) {
                    window.location.href = data.url;
                    return true;
                }
            }, options);

            var selected = $(domObj),
                param = {
                    title: (typeof selected.data('title') === 'undefined' ? options.Title : selected.data('title')),
                    method: (typeof selected.data('method') === 'undefined' ? 'Confirm' : selected.data('method')),
                    values: (typeof selected.data('values') === 'undefined' ? null : selected.data('values')),
                    text: (typeof selected.data('text') === 'undefined' ? options.Text : selected.data('text')),
                    modalName: (typeof selected.data('modal') === 'undefined' ? options.ModelName : selected.data('modal')),
                    url: domObj.href

                }, handle = {
                    confirm: '[data-confirm="modal"]',
                    decline: '[data-cancel="modal"]',
                    body: ".modal-body"

                }, makeSelectList = function (data) {
                    var optagroup=param.optagroup;
                    
                    var i, html = ''+param.text;
                           html=html+'<select name="optionalextras" class="form-control">';
                     for (var key in data) {
                       if(selectedValue==key){
                         html += "<option selected title=\"" + data[key]+ "\" value=\"" + key + "\">" + data[key] + "</option>";
                       }else{
                          html += "<option title=\"" + data[key]+ "\" value=\"" + key + "\">" + data[key] + "</option>";
                       }
                    }

                    html += '</select>';
                    return html;

                },
                makeOptaSelectList = function (data) {
                         var i, html = ''+param.text;
                           html=html+'<select name="optionalextras" class="form-control">';
                  
                  var obj = $.parseJSON(data);
                  console.log(obj);
                     $.each( obj.data, function( i, item ) {
                          html += "<optgroup  label=\"" + item.groupname+ "\">";
                       $.each( item.list, function( i, item2 ) {
                       if(selectedValue==item2.key){
                         html += "<option selected title=\"" + item2.key+ "\" value=\"" + item2.key + "\">" + item2.value+ "</option>";
                       }else{
                          html += "<option title=\"" + item2.key+ "\" value=\"" + item2.key + "\">" +item2.value + "</option>";
                       
                      } });
                        html +="</optgroup>";
                    });

                    html += '</select>';
                    return html;

                },
                makeRadioList = function (data) {

                    var i, html =  ''+param.text;

                    for (i = 0; i < data.length; i += 1) {

                        html += "<div class=\"radio\"><label>";
                        html += "<input type=\"radio\" name=\"optionalextras\" id=\"" + data[i] + "\"  value=\"" + data[i] + "\" />" + data[i];
                        html += "</label></div>";
                    }
                    return html;

                },makeInput = function (data) {

                    var html = ''+param.text;
                        html += "<div class=\"bootbox-body\">";
						if(selectedValue==null || typeof selectedValue === 'undefined' || selectedValue==''){
                            html += "<input name='inputText' type=\"text\" class=\"bootbox-input bootbox-input-text form-control\">";                          
						
						}else{
						    html += "<input value="+selectedValue+" name='inputText' type=\"text\" class=\"bootbox-input bootbox-input-text form-control\">";
						}
                        html += "</div>";
                   return html;

                },

                
				buildModal = function () {

                    var message;

                    switch (param.method) {
                        case "select":
                            message = makeSelectList((typeof selectlist === 'undefined' ? selected.data('values'):selectlist));
                            break;
                        case "selectoptagroup":
                            message = makeOptaSelectList((typeof selectlist === 'undefined' ? selected.data('values'):selectlist));
                            break;    
                        case "radio":
                            message = makeRadioList(param.values.split('/'));
                            break;
					   case "input":
                            message = makeInput();
                            break;
                        default:
                            message = param.text;
                            break;
                    }

                  
                    $(param.modalName + " h4").html(param.title);
                    $(param.modalName).find($(handle.body)).empty().html(message);
                    $(handle.decline).empty().html(options.Cancel);
                    $(handle.confirm).empty().html(options.Confirm);
                    $(param.modalName).data('bs.modal', null);
					$(param.modalName).data('modal', null);
					$(param.modalName).modal('show');
					  
                    $(handle.confirm).off('click').on('click', function () {
                        var selectedValue = $('input[name = "optionalextras"]:checked').val() || $('select[name = "optionalextras"]').val() ||
						                    $('input[name = "inputText"]').val(),
                                            result = { url: param.url, data: selectedValue, message: param.text.replace('xxx', selectedValue) };

                        var retvalue=options.OK(result);
                      if(retvalue){
                          $(handle.decline).click();
                       }
                    });
                    return false;
                };

            buildModal();
        }

    //};
PK 
     �tG�,0|�  �                   googleAnalytics.jsPK 
     �|G�-���  �               �  RemoteSite.jsPK 
     x�Gee0�i  i               �  jqueryTabCustomStyle.cssPK 
     |�)GY���  �               �"  jquery-DynamicModal-1.1.0.jsPK        �=    