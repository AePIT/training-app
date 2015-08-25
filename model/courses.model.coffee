@Courses = new Mongo.Collection('courses')

Courses.allow
  insert: (userId, course) ->
    userId
  update: (userId, course, fields, modifier) ->
    userId
  remove: (userId, course) ->
    userId
