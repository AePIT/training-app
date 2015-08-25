@userexists = (user) ->
    	return Meteor.users.findOne {
	      $or: [{ username: user.username }, { 'emails.address': user.email }]
	    }
	    