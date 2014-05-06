//= require_tree .

window.TrackMgmt = Ember.Application.create();

TrackMgmt.Router.reopen({
  rootURL: '/planning/conferences/:id/tracks'
})

TrackMgmt.Router.map(function(){
  this.resource('track-mgmt', { path: '/'});
});