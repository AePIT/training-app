@Things = new Mongo.Collection('things', {
  transform: (thing) ->
    thing.speak = -> console.log 'the thing speaks!'
    thing
  })

Things.allow
  insert: (userId, thing) ->
    thing.createdAt = new Date()
    thing.name_sort = thing.name.toLowerCase()
    true
  update: (userId, thing, fields, modifier) ->
    thing.updatedAt = new Date()
    thing.name_sort = thing.name.toLowerCase()
    true
  remove: (userId, thing) ->
    true
