//= require action_cable
//= require selt
//= require tree ./chennels
(function() {
  this.App || (this.App = {});

  App.cable = ActionCable.createConsumer();

}).call(this);
