@userexists = (user) ->
  Meteor.users.findOne 'emails.address': user.email

# creates a new user, and adds them to role/roles specified. if user already exists, they are simply added to the specified role instead
@addUser = ( user, roles ) ->
  existing = userexists user
  if exisiting is undefined then id = Accounts.createUser userObject
  else id = existing._id
  Roles.addUsersToRoles id,  roles
  return id

#removes a user from the specified role/roles.
@removeUser = ( user, roles ) ->
  Roles.RemoveUsersFromRoles user, roles
  return user._id
