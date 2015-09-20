controllers = angular.module('controllers')

controllers .controller('ScreeningController' , ['$scope' ,'$routeParams', '$location', 'ScreeningsService' , 'flash', '$state' , 'MoviesService', 'TheatersService', 'UserService' , 'ReservationsService', '$rootScope' ,
    ($scope, $routeParams, $location , ScreeningsService , flash , $state  , MoviesService , TheatersService , UserService , ReservationsService , $rootScope) ->

        $scope.numbers = [ '1' , '2' , '3' , '4' , '5']
        movies = []
        $scope.reservation = {}

        if $state.params.id
            ScreeningsService.getScreening($state.params.id).then (response) ->
                $scope.screening = response
                $scope.screening.start_datetime = new Date($scope.screening.start_datetime).toISOString();
                console.log $scope.screening
                $scope.getTheaters()

        MoviesService.getMovies().then (response)-> $scope.movies = response

        $scope.getTheaters = () ->
            TheatersService.getTheaters().then (response) ->
                $scope.theaters = response
                angular.forEach $scope.theaters , (value, key) ->
                    if value.id == $scope.screening.room.theater_id
                        $scope.screening.room.theater = value;
                $scope.getRooms($scope.screening.room.theater)



        $scope.back = () -> $state.go 'screenings.list'

        $scope.save = ()->
            $scope.screening.room_id = $scope.screening.room.id;
            $scope.screening.movie_id = $scope.screening.movie.id;
            if $scope.screening.id
                ScreeningsService.updateScreening($scope.screening).then (response)->
                    $scope.screening = response
            else
                ScreeningsService.saveScreening($scope.screening).then (response)->
                    $state.go 'screenings.edit' , id: response.id


        $scope.delete = ->
            ScreeningsService.deleteScreening($scope.screening).then(()-> $scope.back())

        $scope.edit = (screeningId)-> $state.go 'screenings.edit' , id: screeningId

        $scope.getRooms = (theater) ->
            $scope.rooms = theater.rooms

        $scope.reserve = ->
            $scope.reservation.user_id = $rootScope.user.id
            $scope.reservation.screening_id = $scope.screening.id
            $scope.reservation.number_of_tickets = $scope.selectedNumber
            ReservationsService.saveReservation($scope.reservation).then (response) ->
                alert('Reserved')


])
