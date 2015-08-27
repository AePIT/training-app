Meteor.startup ->
  facilitators = [
    {
    email: 'rozelle@aepaud.co.za'
    password: 'lombard'
    profile:
      name: 'Rozelle Lombard'
    }
  ]

  facilitators.forEach (user) -> addUser user, 'facilitator'
