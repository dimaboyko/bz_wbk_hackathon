//= require cable
//= require_self
//= require_tree .

this.App = {};

App.cable = ActionCable.createConsumer();


App.documents = App.cable.subscriptions.create( {channel: 'DocumentsChannel'}, {
  received: function(data) {
    console.log('received');
  },
   connected: function(_data) {
      console.log('connected')
    },
});
