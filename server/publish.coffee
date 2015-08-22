Meteor.publish 'usersPublish', () ->
  Meteor.users.find()
Meteor.publish 'getUserTokens', () ->
  Tokens.find()
