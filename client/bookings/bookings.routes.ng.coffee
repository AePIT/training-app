'use strict'

angular.module 'v4App'
.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'bookings-list',
    url: '/bookings'
    templateUrl: 'client/bookings/bookings-list.view.html'
    controller: 'BookingsListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
  .state 'booking-detail',
    url: '/bookings/:bookingId'
    templateUrl: 'client/bookings/booking-detail.view.html'
    controller: 'BookingDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
]