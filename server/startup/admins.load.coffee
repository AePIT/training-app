Meteor.startup ->
	users = [
	    {
	      username: 'alpha'
	      email: 'alpha@aepit.co.za'
	      password: 'tawanda'
	      profile:
	        name: 'Alpha'
	    }
	]

	users.forEach (user) -> addUser user, 'admin'
