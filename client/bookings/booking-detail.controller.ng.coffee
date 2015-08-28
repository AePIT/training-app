'use strict'

angular.module 'v4App'
.controller 'BookingDetailCtrl', ['$scope', '$stateParams', '$meteor', ($scope, $stateParams, $meteor) ->
  $scope.booking = $scope.$meteorObject Bookings, $stateParams.bookingId
  $scope.$meteorSubscribe('bookings')
  
  $scope.save = () ->
    if $scope.form.$valid
      $scope.booking.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
        (error) ->
          console.log 'save error ', error
      )
        
  $scope.reset = () ->
    $scope.booking.reset()
]