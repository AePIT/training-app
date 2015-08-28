@userexists = (user) ->
  Meteor.users.findOne 'emails.address': user.email

# creates a new user, and adds them to role/roles specified. if user already exists, they are simply added to the specified role instead
@addUser = ( userObject, roles ) ->
  user = userexists userObject
  if user is undefined then user = Accounts.createUser userObject
  Roles.addUsersToRoles user,  roles
  return user._id

#removes a user from the specified role/roles.
@removeUser = ( user, roles ) ->
  Roles.RemoveUsersFromRoles user, roles
  return user._id
