controllers = angular.module('controllers')

controllers .controller('MovieController' , ['$scope' ,'$routeParams', '$location', 'MoviesService' , 'flash', '$state' ,
    ($scope, $routeParams, $location , MoviesService , flash , $state) ->

        if $state.params.id
            MoviesService.getMovie($state.params.id).then (response)-> $scope.movie = response

        $scope.back = () -> $state.go 'movies.list'

        $scope.save = ()->
            if $scope.movie.$id
                MoviesService.updateMovie($scope.movie).then (response)->
                    $scope.movie = response
            else
                MoviesService.saveMovie($scope.movie).then (response)->
                    $state.go 'movies.edit' , id: response.id

        $scope.edit = (movieId)-> $state.go 'screenings.edit' , id: movieId

        $scope.delete = ->
            MoviesService.deleteMovie($scope.movie).then(()-> $scope.back())
])
