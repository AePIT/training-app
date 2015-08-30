Function::property = (prop, desc) ->
  Object.defineProperty @prototype, prop, desc

class Booking
  @property 'course',
    get: -> Courses.findOne @courseId
    set: (courseId) -> @courseId = courseId

@Bookings = new Mongo.Collection('bookings');

Bookings.allow
  insert: (userId, booking) ->
    userId
  update: (userId, booking, fields, modifier) ->
    userId
  remove: (userId, booking) ->
    userId

Bookings.helpers
  course: ->
    Courses.findOne @courseId
  clients: ->
    _.map @clientIds, (clientId) -> Clients.findOne clientId
