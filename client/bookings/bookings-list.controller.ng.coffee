'use strict'

angular.module 'v4App'
.controller 'BookingsListCtrl', ['$scope', '$meteor', ($scope, $meteor) ->
  $scope.bookings = $scope.$meteorCollection Bookings
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('bookings')

  $meteor.session 'bookingsCounter'
  .bind $scope, 'page'
    
  $scope.save = () ->
    if $scope.form.$valid
      $scope.bookings.save $scope.newBooking
      $scope.newBooking = undefined
      
  $scope.remove = (booking) ->
    $scope.bookings.remove booking
]