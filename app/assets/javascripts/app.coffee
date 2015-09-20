angular.module('cinema',[
    'templates',
    'ngRoute'
    'ngResource',
    'controllers',
    'services',
    'ngCookies',
    'angular-flash.service',
    'angular-flash.flash-alert-directive',
    'ui.router',
    'ng-token-auth',
    'ipCookie'
])


movies = [
  {
    id: 1,
    name: 'The Shinning'
  },
  {
    id: 2,
    name: 'The Good Fellas'
  },
  {
    id: 3,
    name: 'Django Unchained'
  },
  {
    id: 4,
    name: 'Star Wars'
  },
]
angular.module('cinema').config(['flashProvider' ,  (flashProvider )->
    flashProvider.errorClassnames.push("alert-danger")
    flashProvider.warnClassnames.push("alert-warning")
    flashProvider.infoClassnames.push("alert-info")
    flashProvider.successClassnames.push("alert-success")

  ])




controllers = angular.module('controllers',[])
services = angular.module('services' , [])
