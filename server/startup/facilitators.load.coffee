Meteor.startup ->
  facilitators = [
    {
    username: 'rozelle'
    email: 'rozelle@aepaud.co.za'
    password: 'lombard'
    profile:
      name: 'Rozelle Lombard'
    }
  ]

  facilitators.forEach (user) -> addUser user, 'facilitator'
