Template.Signin.events
  'click .btn-form': (e) ->
    $('.c-hide').css('display', 'none')
    $('.'+ e.target.id).toggle()

Template.Signin_pass.events
  'submit .form-authorize-pass': (e) ->
    e.preventDefault()
    username = $('[name=login]').val()
    password = $('[name=password]').val()
    $('[name=login]').val('')
    $('[name=password]').val('')
    Meteor.loginWithPassword username, password, (error) ->
      if (error)
        sAlert.warning 'Wrong combination username/password'
      else
        Router.go 'gratz'

Template.Signin_pin.events
  'submit .form-authorize-pin': (e) ->
    e.preventDefault()
    username = $('.select-params').val()
    pin = $('[name=pin]').val()
    id = Meteor.users.findOne(username: username)._id
    token_id = Tokens.findOne(user_id: id)._id
    console.log token_id + ' ------------- ' + id
    if Meteor.users.findOne(username: username, profile: {pin: pin} ) && Tokens.findOne(user_id: id).loginTryCount != 0
      currToken = Tokens.findOne(user_id: id).token
      Meteor.loginWithToken currToken
      Router.go 'gratz'
    else if Tokens.findOne(user_id: id).loginTryCount == 0 && pin != Meteor.users.findOne(_id: id).profile.pin
           sAlert.error 'Failed 4 tryes. Login with password, please!'
         else  if pin != Meteor.users.findOne(username: username).profile.pin && Tokens.findOne(user_id: id).loginTryCount > 0
                tryNumb = Tokens.findOne(user_id: id).loginTryCount - 1
                if tryNumb == -1
                  tryNumb = 0
                sAlert.error 'You have only ' + tryNumb + ' attempts'
                Tokens.update
                  _id: token_id
                  {
                  $set:
                    loginTryCount: tryNumb
                 }



Template.Signin_pin.helpers
  users: Meteor.users.find()

  Template.Signin_pin.onRendered ->
    if Session.get 'ChangeUserName'
      $('.pin-authorize').toggle()
      $('.select-params').find('option:contains("' + Session.get("ChangeUserName") + '")').attr('selected', 'selected')
    return
