'use strict'

angular.module 'v4App'
.controller 'FacilitatorDetailCtrl', ['$scope', '$stateParams', '$meteor', ($scope, $stateParams, $meteor) ->
  $scope.facilitator = $meteor.object Meteor.users, $stateParams.facilitatorId
  $meteor.subscribe('facilitators')

  $scope.save = () ->
    if $scope.form.$valid
      $scope.facilitator.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
        (error) ->
          console.log 'save error ', error
      )

  $scope.reset = () ->
    $scope.facilitator.reset()
]
