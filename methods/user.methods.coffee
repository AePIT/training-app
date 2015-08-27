'use strict'

Meteor.methods
  addUser: (user, role) ->
    console.log user, role
    addUser(user, role)
  removeUser: (user, role) -> removeUser(user, role)
