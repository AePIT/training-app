// describe('Booking', function() {
//   var booking;
//
//   beforeEach(function(){
//     booking = new Booking();
//   });
//
//   it('should assign course to courseId',function(){
//     spyOn(Courses, 'findOne').and.callFake(function(id, callback){
//       console.log('testing find');
//       callback({name:'test course'});
//     });
//     id = '12344325';
//     booking.course = id;
//     console.log('getting'+ booking.course);
//     expect(Courses.findOne).toHaveBeenCalledWith(id);
//   });
// });
