Meteor.startup ->
  if Bookings.find().count() == 0
    bookings = [
      {
        'name': 'booking 1'
      }
      {
        'name': 'booking 2'
      }
    ]
    bookings.forEach (booking) ->
      Bookings.insert booking