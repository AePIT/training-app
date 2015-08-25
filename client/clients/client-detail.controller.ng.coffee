'use strict'

angular.module 'v4App'
.controller 'ClientDetailCtrl', ['$scope', '$stateParams', '$meteor', ($scope, $stateParams, $meteor) ->
  $scope.client = $meteor.object Clients, $stateParams.clientId
  $meteor.subscribe('clients')
  
  $scope.save = () ->
    if $scope.form.$valid
      $scope.client.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
        (error) ->
          console.log 'save error ', error
      )
        
  $scope.reset = () ->
    $scope.client.reset()
]