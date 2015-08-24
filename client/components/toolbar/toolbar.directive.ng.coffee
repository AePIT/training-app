'use strict'

angular.module 'v4App'
.directive 'toolbar', [() ->
  {
    restrict: 'AE'
    templateUrl: 'client/components/toolbar/toolbar.view.html'
    replace: true
  }
]