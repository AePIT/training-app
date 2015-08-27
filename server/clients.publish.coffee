'use strict'

Meteor.publish 'clients', -> Roles.getUsersInRole 'client'
