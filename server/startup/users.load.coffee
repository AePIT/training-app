Meteor.startup ->
	users = [
	    {
	      username: 'rozelle'
	      email: 'rozelle@aepaud.co.za'
	      password: 'lombard'
	      profile:
	        name: 'Rozelle Lombard'
	        roles: ['facilitator']
	    }
	    {
	      username: 'alpha'
	      email: 'alpha@aepit.co.za'
	      password: 'tawanda'
	      profile:
	        name: 'Alpha'
	        roles: ['admin']
	    }
	]

	users.forEach (item) ->
		user = userexists item
		if user is undefined
			user = Accounts.createUser item

		if item.profile.roles
			Roles.addUsersToRoles user._id,item.profile.roles