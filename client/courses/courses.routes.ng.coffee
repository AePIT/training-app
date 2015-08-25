'use strict'

angular.module 'v4App'
.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'courses-list',
    url: '/courses'
    templateUrl: 'client/courses/courses-list.view.html'
    controller: 'CoursesListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
  .state 'course-detail',
    url: '/courses/:courseId'
    templateUrl: 'client/courses/course-detail.view.html'
    controller: 'CourseDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
]