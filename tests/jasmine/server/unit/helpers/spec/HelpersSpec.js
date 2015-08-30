describe("User Helpers", function() {
  xdescribe('userexists', function() {
    beforeEach(function() {
      this.user = {
        email: 'user@user.com',
        password: 'user'
      };
    });

    it('should return undefined if a user does not exist', function() {
      var result = userexists(this.user);
      expect(result).not.toBeDefined();
    });

    it('should return a given user if he/she exists', function() {
      spyOn(Meteor.users,'insert')
      addUser(this.user,'');
      expect(Meteor.users.insert).toHaveBeenCalled();
      var result = userexists(this.user);
      // expect(result).toBeDefined();
    });
  });


  it("should add a user to a role, creating one if it doesn't exist", function() {
    var admin = {
      email: 'admin@admin.com',
      password: 'admin',
      profile: {
        name: 'Administrator'
      }
    };
  });

  xdescribe('userMethods', function() {
    it('should add a user to a role', function() {
      var user = {
          email: 'user@user.com',
          password: 'user'
        };
        console.log(Courses.find());
        // spyOn(this,'')
        // expect(Meteor.users.insert).toHaveBeenCalled();

      Meteor.call('addUser', user, 'tester', function(result){
        expect(result).toBeDefined();
      });
    });
  });
});
