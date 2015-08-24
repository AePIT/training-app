'use strict'

angular.module 'v4App'
.config ['$mdThemingProvider', ($mdThemingProvider) ->
  $mdThemingProvider.theme('default')
  .primaryPalette('deep-orange')
  .accentPalette('lime')
]