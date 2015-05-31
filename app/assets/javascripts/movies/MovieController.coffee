controllers = angular.module('controllers')

controllers	.controller('MovieController' , ['$scope' ,'$routeParams', '$location', 'MoviesService' , 'flash', '$state' , 
	($scope, $routeParams, $location , MoviesService , flash , $state) ->
		
		if $state.params.id
			$scope.movie = MoviesService.getMovie($state.params.id)
		
		$scope.back = () -> $state.go 'movies.list'

		$scope.save = ()-> 
			if $scope.movie.$id
				MoviesService.updateMovie($scope.movie)
			else
				MovieResponse = MoviesService.saveMovie($scope.movie)				
				$state.go 'movies.edit' , id: MovieResponse.id
		
		$scope.delete = ->
			MoviesService.deleteMovie($scope.movie)
			$scope.back()
])