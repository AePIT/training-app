'use strict'

angular.module 'v4App'
.controller 'FacilitatorsListCtrl', ['$scope', '$meteor', ($scope, $meteor) ->
  $scope.facilitators = $meteor.collection -> Roles.getUsersInRole 'facilitator'

  $meteor.autorun $scope, () -> $meteor.subscribe('facilitators')

  $scope.save = () ->
    if $scope.form.$valid
      addUser $scope.newFacilitator, 'facilitator'
      $scope.newFacilitator = undefined

  $scope.remove = (facilitator) -> removeUser facilitator, 'facilitator'
]
