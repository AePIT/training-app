'use strict'

angular.module 'v4App'
.controller 'AddClientModalCtrl',
['$scope','$meteor','$mdDialog', 'selectedClients',
($scope, $meteor, $mdDialog, selectedClients) ->
  $scope.searchText = ''
  $scope.clients = $scope.$meteorCollection ->
    Roles.getUsersInRole 'client'
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe 'clients'
  $scope.searchClients = $scope.$meteorCollection ->
    Meteor.users.find(
      $and:[
        {"roles": "client"}
        {"profile.name": { $regex: new RegExp($scope.searchText) }}
      ])

  $scope.selected = (client) ->
    _.contains selectedClients, client._id

  $scope.toggle = (client) ->
    if selectedClients is undefined then selectedClients = []
    if _.contains selectedClients, client._id
      selectedClients = _.without selectedClients, client._id
    else
      selectedClients.push client._id

  $scope.close =
    $mdDialog.hide selectedClients
]
