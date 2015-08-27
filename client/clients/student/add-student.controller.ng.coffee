'use strict'

angular.module 'v4App'
.controller 'AddStudentModalController', ['$scope', '$meteor', '$mdDialog', ($scope, $meteor, $mdDialog) ->
  $scope.cancel = -> $mdDialog.cancel()

  $scope.save = ->
    success = (id) ->
      $mdDialog.hide id
    fail = (err)->
      console.log err
    if @form.$valid
      $meteor.call('addUser', @newStudent, 'student')
      .then success, fail
]
