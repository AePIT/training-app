Meteor.startup ->
  if Roles.getUsersInRole('client').count() is 0
    clients = [
      {
        email: 'client1@clients.com'
        profile: {
          'name': 'client 1'
          'contactPerson': 'Person'
          'phone': '012 234 3455'
          studentIds: [

          ]
        }
      }
    ]
    clients.forEach (client) -> addUser client, 'client'
