Meteor.users.allow
  insert: (userId, client) ->
    userId
  update: (userId, client, fields, modifier) ->
    userId
  remove: (userId, client) ->
    userId

Meteor.users.helpers
  students: ->
    if Roles.userIsInRole(@_id, 'clients')
      if @studentIds is undefined then @studentIds = []
      _.map studentIds, (id) -> Meteor.users.findOne id
