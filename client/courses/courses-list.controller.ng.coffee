'use strict'

angular.module 'v4App'
.controller 'CoursesListCtrl', ['$scope', '$meteor', ($scope, $meteor) ->
  $scope.courses = $meteor.collection Courses
  $meteor.autorun $scope, () ->
    $meteor.subscribe('courses')

  $scope.save = () ->
    if $scope.form.$valid
      $scope.newCourse.classes = []
      $scope.courses.save $scope.newCourse
      $scope.newCourse = undefined

  $scope.remove = (course) ->
    $scope.courses.remove course
]
