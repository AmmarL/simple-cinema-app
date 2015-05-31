controllers = angular.module('controllers')

controllers.controller("MoviesController", [ '$scope','$state', '$location', '$resource' , 'MoviesService',
  ($scope , $state, $location , $resource , MoviesService)->
    $scope.search = (keywords)-> 
    	console.log keywords
    	$state.go 'movies.list', keywords: keywords


    Movie = $resource('/movies/:movieId', { movieId: "@id", format: 'json' })

    console.log $state.params.keywords
    if $state.params.keywords
        $scope.movies = MoviesService.getMovies($state.params.keywords, (results)-> $scope.movies = results)
    else
        $scope.movies = []
    
    $scope.view = (movieId)-> $state.go 'movies.show' , id: movieId

    $scope.newMovie = ()-> $state.go 'movies.new'

    $scope.edit = (movieId)-> $state.go 'movies.edit' , id: movieId

    $scope.delete = (movie)->
            MoviesService.deleteMovie(movie)
            $scope.back()
])