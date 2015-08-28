'use strict'

Meteor.publish 'bookings', -> Bookings.find()
