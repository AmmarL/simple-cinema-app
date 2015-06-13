controllers = angular.module('controllers')

controllers.controller('TheaterController' , ['$scope' ,'$routeParams', '$location', 'TheatersService' , 'flash', '$state' , 
    ($scope, $routeParams, $location , TheatersService , flash , $state) ->
        
        if $state.params.id
            TheatersService.getTheater($state.params.id).then (response)-> $scope.theater = response
        
        $scope.back = () -> $state.go 'theaters.list'

                                      
        

])