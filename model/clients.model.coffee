@Clients = new Mongo.Collection('clients')

Clients.allow
  insert: (userId, client) ->
    userId
  update: (userId, client, fields, modifier) ->
    userId
  remove: (userId, client) ->
    userId
