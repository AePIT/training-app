Meteor.users.allow
  insert: (userId, client) ->
    userId
  update: (userId, client, fields, modifier) ->
    userId
  remove: (userId, client) ->
    userId

Meteor.users.helpers
  students: ->
    # if Roles.userIsInRole(@_id, 'client')
    if @profile.studentIds is undefined then @profile.studentIds = []
    _.map @profile.studentIds, (id) -> Meteor.users.findOne id
