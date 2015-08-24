angular.module 'v4App', [
  'angular-meteor'
  'ui.router'
  'ngMaterial'
]

onReady = () ->
  angular.bootstrap document, ['v4App']
  
if Meteor.isCordova
  angular.element(document).on 'deviceready', onReady
else
  angular.element(document).ready onReady