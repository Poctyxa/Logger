if (Meteor.isClient)
  Template.Registration.events
    'submit form': (e) ->
      e.preventDefault()
      email = $('[name=at-field-email]').val()
      login = $('[name=at-field-username]').val()
      password = $('[name=at-field-password]').val()
      pin = $('[name=at-field-pin]').val()
      if Meteor.isServer
        Accounts.createUser
          email: email
          username: login
          password: password
          pin: pin
        , (error) ->
            if (error)
              console.log error.reason
            else
              Router.go 'gratz'
