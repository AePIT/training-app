Meteor.users.allow
  insert: (userId, facilitator) ->
    userId
  update: (userId, facilitator, fields, modifier) ->
    userId
  remove: (userId, facilitator) ->
    userId

Meteor.users.helpers
  email: -> if @emails and @emails.length > 0 then @emails[0].address
