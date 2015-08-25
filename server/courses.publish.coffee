'use strict'
Meteor.publish 'courses', ->
  Courses.find()
