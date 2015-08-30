'use strict'

angular.module 'v4App'
.controller 'BookingsListCtrl',
['$scope', '$meteor', '$mdDialog', '$location',
($scope, $meteor, $mdDialog, $location) ->
  $scope.bookings = $scope.$meteorCollection Bookings
  $scope.courses = $scope.$meteorCollection Courses
  $scope.clients = $scope.$meteorCollection -> Roles.getUsersInRole 'client'
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('bookings')
    $scope.$meteorSubscribe('courses')
    $scope.$meteorSubscribe('clients')

  $meteor.session 'bookingsCounter'
  .bind $scope, 'page'

  $scope.save = () ->
    if $scope.form.$valid
      $scope.bookings.save $scope.newBooking
      $scope.newBooking = undefined

  $scope.remove = (booking) ->
    $scope.bookings.remove booking

  $scope.addClient = (event)->
    if $scope.newBooking is undefined then $scope.newBooking = { clientIds: [] }
    $mdDialog.show
      locals: {selectedClients: $scope.newBooking.clientIds}
      controller: "AddClientModalCtrl"
      templateUrl: 'client/bookings/add-client.modal.html'
      parent: angular.element(document.body)
      targetEvent: event
      clickOutsideToClose: false
    .then(
      success = (clients) ->
        $scope.newBooking.clientIds = clients
      fail = ->
    )

  $scope.showClient = (client)->
    $location.path '/clients/'+client._id

  $scope.removeClient = ->

]
