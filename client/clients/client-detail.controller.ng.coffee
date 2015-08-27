'use strict'

angular.module 'v4App'
.controller 'ClientDetailCtrl', ['$scope', '$stateParams', '$meteor', '$mdDialog', ($scope, $stateParams, $meteor, $mdDialog) ->
  $scope.client = $meteor.object Meteor.users, $stateParams.clientId
  $scope.students = $meteor.collection -> Roles.getUsersInRole 'student'
  $meteor.subscribe 'clients'
  $meteor.subscribe 'students'

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

  $scope.addStudent = (event) ->
    success = (studentId) ->
      unless _.contains $scope.studentIds studentIds
        $scope.client.profile.studentIds.push studentId
    fail = ->
    $mdDialog.show
      controller: 'AddStudentModalController'
      templateUrl: 'client/clients/student/add-student.modal.html'
      parent: angular.element document.body
      targetEvent: event
      clickOutsideToClose: false
    .then success, fail

  $scope.removeStudent = (student)->
    $scope.client.studentIds = _.without $scope.client.studentIts, student._id
    if student.roles and student.roles.length > 1 then $meteor.call 'removeUser', student, 'student'
    else $scope.students.remove student

  $scope.showStudent = (studentId, event) ->
    $mdDialog.show
      locals: {studentId: studentId}
      controller: 'ViewStudentModalController'
      templateUrl: 'client/clients/student/view-student.modal.html'
      parent: angular.element document.body
      targetEvent: event
      clickOutsideToClose: false
]
