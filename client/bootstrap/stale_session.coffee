heartbeat = 1000
activity = false
activityEvents = 'mousemove click keydown'
counter = 0

Meteor.startup ->
  Meteor.setInterval ->
    if Meteor.userId() && activity
      counter = 0
      activity = false
    else if Meteor.userId()
      counter++
      if counter == 600
        Meteor.logout()
        counter = 0
        Router.go 'home'
  ,
   heartbeat
  $(document).on(activityEvents, ->
    activity = true
    return
    )
