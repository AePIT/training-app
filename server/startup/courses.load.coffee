Meteor.startup ->
  if Courses.find().count() == 0
    courses = [
      {
        'name': 'course 1'
      }
      {
        'name': 'course 2'
      }
    ]
    courses.forEach (course) ->
      Courses.insert course