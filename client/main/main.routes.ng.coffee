'use strict'

angular.module 'v4App'
.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'main',
    url: '/'
    templateUrl: 'client/main/main.view.html'
    controller: 'MainCtrl'
]