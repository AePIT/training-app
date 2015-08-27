'use strict'

angular.module 'v4App'
.controller 'ViewStudentModalController', ['$scope', '$meteor', '$mdDialog', 'studentId', ($scope, $meteor, $mdDialog, studentId) ->
  $scope.student = $meteor.object Meteor.users, studentId, false
  $meteor.subscribe 'students'

  $scope.cancel = ->
    $scope.student.reset()
    $mdDialog.cancel()

  $scope.reset = -> $scope.student.reset()

  $scope.save = ->
    if $scope.form.$valid
      $scope.student.save().then(
        () ->
        (err) ->
          console.log err
      )
]
