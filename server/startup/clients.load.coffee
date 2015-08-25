Meteor.startup ->
  if Clients.find().count() == 0
    clients = [
      {
        'name': 'client 1'
      }
      {
        'name': 'client 2'
      }
    ]
    clients.forEach (client) ->
      Clients.insert client