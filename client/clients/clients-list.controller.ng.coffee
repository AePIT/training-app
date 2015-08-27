'use strict'

angular.module 'v4App'
.controller 'ClientsListCtrl', ['$scope', '$meteor', ($scope, $meteor) ->
  $scope.clients = $meteor.collection -> Roles.getUsersInRole 'client'
  $meteor.autorun $scope, () ->
    $meteor.subscribe('clients')

  $scope.save = () ->
    if $scope.form.$valid
      $scope.clients.save $scope.newClient
      $scope.newClient = undefined

  $scope.remove = (client) ->
    $scope.clients.remove client
]
