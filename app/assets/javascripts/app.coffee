cinema = angular.module('cinema',[
    'templates',
    'ngRoute',
    'ngResource',
    'controllers'
])

cinema.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
      .when('/',
        templateUrl: "index.html"
        controller: 'MoviesController'
      )
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

controllers = angular.module('controllers',[])
