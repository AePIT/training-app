'use strict'

Meteor.methods
  addUser: (user, role) -> addUser(user, role)
  removeUser: (user, role) -> removeUser(user, role)
