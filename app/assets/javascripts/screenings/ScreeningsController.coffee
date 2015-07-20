controllers = angular.module('controllers')

controllers.controller("ScreeningsController", [ '$scope','$state', '$location', '$resource' , 'ScreeningsService',
  ($scope , $state, $location , $resource , ScreeningsService)->
    $scope.search = (keywords)->
    	console.log keywords
    	$state.go 'screenings.list', keywords: keywords


    ScreeningsService.getScreenings().then (results)->
        $scope.screenings = results

    $scope.view = (screeningId)-> $state.go 'screenings.show' , id: screeningId

    $scope.newScreening = ()-> $state.go 'screenings.new'

    $scope.edit = (screeningId)-> $state.go 'screenings.edit' , id: screeningId

    $scope.delete = (screening)->
            screeningsService.deletescreening(screening).then( ()-> $scope.back() )

])
