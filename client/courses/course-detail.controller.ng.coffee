'use strict'

angular.module 'v4App'
.controller 'CourseDetailCtrl', ['$scope', '$stateParams', '$meteor', '$mdDialog', ($scope, $stateParams, $meteor, $mdDialog) ->
  $scope.course = $meteor.object Courses, $stateParams.courseId
  $meteor.subscribe('courses')

  if $scope.course.classes is undefined then $scope.course.classes = []

  $scope.save = () ->
    if $scope.form.$valid
      $scope.course.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
        (error) ->
          console.log 'save error ', error
      )

  $scope.addClass = ->
    if $scope.course.classes is undefined then $scope.course.classes=[]
    $scope.course.classes.push { title: '', duration: 0, cost: 0 }

  $scope.showClass = (c, event) ->
    i = $scope.course.classes.indexOf c
    success = (c) ->
      $scope.course.classes[i] = c
    fail = ->
    $mdDialog.show
      locals: {c: c}
      controller: 'ClassModalController'
      templateUrl: 'client/courses/class-modal.view.html'
      parent: angular.element(document.body)
      targetEvent: event
      clickOutsideToClose:true
    .then success, fail

  $scope.removeClass = (c) ->
    $scope.course.classes = _.without $scope.course.classes, c

  $scope.reset = () ->
    $scope.course.reset()
]
.controller 'ClassModalController', ['$scope','c','$mdDialog', ($scope, c,$mdDialog) ->
  $scope["class"] = c

  $scope.cancel = -> $mdDialog.cancel()

  $scope.save = -> $mdDialog.hide $scope['class']
]
