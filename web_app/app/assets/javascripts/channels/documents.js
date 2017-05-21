  App.documents = App.cable.subscriptions.create( {channel: 'DocumentsChannel'}, {
    received: function(data) {
      alert('fo');
    }
  });
