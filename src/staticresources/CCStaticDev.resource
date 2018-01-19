<script type='text/javascript'>

var model = Backbone.Model.Extend(

id: 'SearchingSortingData',
        idAttribute: 'Id',
		
		defaults: {
		firstAttribute: ''
		}

);



var collection = Backbone.collection.extend({
model: model,
sync: sync,
intialize: function(){
this.fetch();
},
demoFunc: function(firstAttribute){
alert('firstAttribute is:'+firstAttribute);
}
);


var contentLibraryView = Backbone.View.extend({
        initialize: function() {
            this.collection.bind('add', this.render, this);
            this.collection.bind('reset', this.render, this);
            this.collection.on('change', this.render, this);
            this.template = _.template($('#my-test-template').html());
            
        },
        events: {
			
			change .countriesClass select' : 'demoFunction'
            /*'change .styled-select select' : 'toggleView',
            'mousedown .content-download-a' : 'startContentDownload',
            'mouseup .content-download-a' : 'downloadFunction',
            'mouseenter .downloadLink': 'showPopover',
            'mouseleave .downloadLink': 'hidePopover'
			*/
        },  
        render: function() {
         this.$el.html(this.template(this.collection.at(0).attributes));     
            
            return this;
        },
    demoFunction: function()
	{
	
	}



</script>