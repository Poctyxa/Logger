@Tokens = new Mongo.Collection 'tokens'


Tokens.allow
  insert: -> true
  update: -> true
  remove: -> true

Accounts.onLogin () ->
  userToken = Accounts._storedLoginToken()
  if (Tokens.findOne user_id: Meteor.userId())
    token_id = Tokens.findOne( user_id: Meteor.userId())._id
    console.log 'token_id = ' + token_id + '         token_value = ' + userToken
    Tokens.update
        _id: token_id
        {
        $set:
          token: userToken
          loginTryCount: 4
         }
  else
    Tokens.insert
      user_id: Meteor.userId()
      token: userToken
      loginTryCount: 4
  return

Meteor.logout = () ->
  Meteor._localStorage.removeItem("Meteor.loginToken");
  Meteor._localStorage.removeItem("Meteor.loginTokenExpires");
  Meteor._localStorage.removeItem("Meteor.userId");

  Accounts.connection.setUserId(null);
  Accounts.connection.onReconnect = null;
  return
