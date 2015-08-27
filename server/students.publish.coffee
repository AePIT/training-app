'use strict'

Meteor.publish 'students', -> Roles.getUsersInRole 'student'
