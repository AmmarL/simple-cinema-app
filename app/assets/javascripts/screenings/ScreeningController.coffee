controllers = angular.module('controllers')

controllers .controller('ScreeningController' , ['$scope' ,'$routeParams', '$location', 'ScreeningsService' , 'flash', '$state' , 'MoviesService', 'TheatersService',
    ($scope, $routeParams, $location , ScreeningsService , flash , $state  , MoviesService , TheatersService) ->
            
        movies = []
        if $state.params.id
            ScreeningsService.getScreening($state.params.id).then (response)-> $scope.screening = response
        
        MoviesService.getMovies().then (response)-> $scope.movies = response

        TheatersService.getTheaters().then (response) -> $scope.theaters = response

        $scope.back = () -> $state.go 'screenings.list'

        $scope.save = ()-> 
            if $scope.screening.$id
                ScreeningsService.updateScreening($scope.screening).then (response)-> 
                    $scope.screening = response
            else
                ScreeningsService.saveScreening($scope.screening).then (response)->                        
                    $state.go 'screenings.edit' , id: response.id
                                      
        
        $scope.delete = ->
            ScreeningsService.deleteScreening($scope.screening).then(()-> $scope.back())        

        $scope.getRooms = (theater) ->
            $scope.rooms = theater.rooms
        
])