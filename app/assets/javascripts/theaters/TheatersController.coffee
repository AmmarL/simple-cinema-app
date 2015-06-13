controllers = angular.module('controllers')

controllers.controller("TheatersController", [ '$scope','$state', '$location', '$resource' , 'TheatersService',
  ($scope , $state, $location , $resource , TheatersService)->
    $scope.search = (keywords)-> 

    TheatersService.getTheaters().then (results)-> 
        $scope.theaters = results
    
    $scope.view = (movieId)-> $state.go 'Theaters.show' , id: movieId


            
])