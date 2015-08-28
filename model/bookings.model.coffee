@Bookings = new Mongo.Collection('bookings')

Bookings.allow
  insert: (userId, booking) ->
    userId
  update: (userId, booking, fields, modifier) ->
    userId
  remove: (userId, booking) ->
    userId
