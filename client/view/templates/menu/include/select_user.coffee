Template.ChangeUser.helpers
  ChUs: () ->
    change_user = Meteor.users.find().fetch()
    change_user

Template.ChangeUserItem.events
  'click .username_href': ->
    tmp = Template.instance()
    Session.set 'ChangeUserName', tmp.$('.username_href').find('strong').html()
    Meteor.logout()
    Router.go 'home'
