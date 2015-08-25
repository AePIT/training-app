'use strict'

Meteor.publish 'facilitators', -> Roles.getUsersInRole 'facilitator'
