'use strict'

angular.module 'v4App'
.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'facilitators-list',
    url: '/facilitators'
    templateUrl: 'client/facilitators/facilitators-list.view.html'
    controller: 'FacilitatorsListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
  .state 'facilitator-detail',
    url: '/facilitators/:facilitatorId'
    templateUrl: 'client/facilitators/facilitator-detail.view.html'
    controller: 'FacilitatorDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
]