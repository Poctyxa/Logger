Router.configure
  layoutTemplate: 'Layout'
  loadingTemplate: 'Loading'
  waitOn: () ->
    [
      Meteor.subscribe 'usersPublish'
      Meteor.subscribe 'getUserTokens'
    ]

Router.route '/',
  name: 'home'
  layoutTemplate: 'Layout'
  action: () ->
    @render 'Signin'

Router.route '/registration',
  name: 'registration'
  lauoutTemplate: 'Layout'
  action: () ->
    @render 'Registration'

Router.route '/gratz',
  name: 'gratz'
  lauoutTemplate: 'Layout'
  action: () ->
    @render 'Gratz'

Router.route '/accessForbidden',
  name: 'accessForbidden'
  action: () ->
    @render 'accessForbidden'
#
# Router.onBeforeAction () ->
#   if Meteor.userId()
#     @next()
#   else
#     Router.go 'accessForbidden'
# ,
#   only: ['gratz']
