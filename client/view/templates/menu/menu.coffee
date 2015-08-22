Template.MainMenu.helpers
  currentUser: Meteor.user()
  changeUser: Meteor.users.find().fetch()

Template.MainMenu.events
  'click .user-logout': (e) ->
    e.preventDefault()
    Meteor.logout()
    Router.go 'home'
