'use strict'

angular.module 'v4App'
.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'clients-list',
    url: '/clients'
    templateUrl: 'client/clients/clients-list.view.html'
    controller: 'ClientsListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
  .state 'client-detail',
    url: '/clients/:clientId'
    templateUrl: 'client/clients/client-detail.view.html'
    controller: 'ClientDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
]