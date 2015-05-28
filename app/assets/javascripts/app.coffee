cinema = angular.module('cinema',[
	'templates',
	'ngRoute',
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
controllers.controller("MoviesController", [ '$scope','$routeParams', '$location',
  ($scope , $routeParams, $location)->
  	$scope.search = (keywords)-> $location.path("/").search('keywords',keywords)


  	if $routeParams.keywords
  		keywords = $routeParams.keywords.toLowerCase();
  		$scope.movies = movies.filter (movie)-> movie.name.toLowerCase().indexOf(keywords) != -1
  	else
  		$scope.movies = []
  	



])