'use strict'

angular.module 'v4App'
.controller 'MainCtrl', ['$scope', '$meteor', ($scope, $meteor) ->
  $scope.things = $meteor.collection Things
  $meteor.autorun $scope, () ->
    $meteor.subscribe('things')
    
  $scope.save = () ->
    if $scope.form.$valid
      $scope.things.save $scope.newThing
      $scope.newThing = undefined
      
  $scope.remove = (thing) ->
    $scope.things.remove thing
]