@userexists = (user) ->
    	return Meteor.users.findOne {
	      $or: [{ username: user.username }, { 'emails.address': user.email }]
	    }

# creates a new user, and adds them to role/roles specified. if user already exists, they are simply added to the specified role instead
@addUser = ( userObject, roles ) ->
  user = userexists userObject

  if user is undefined
    user = Accounts.createUser userObject

  Roles.addUsersToRoles user._id, roles

#removes a user from the specified role/roles.
@removeUser = ( user, roles ) ->
  Roles.RemoveUsersFromRoles user._id, roles
