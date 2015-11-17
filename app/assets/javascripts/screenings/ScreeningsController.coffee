controllers = angular.module('controllers')

controllers.controller("ScreeningsController", [ '$scope','$state', '$location', '$resource' , 'ScreeningsService', '$rootScope' ,
  ($scope , $state, $location , $resource , ScreeningsService , $rootScope )->

    console.log  $rootScope.user

    $scope.search = (keywords)->
    	console.log keywords
    	$state.go 'screenings.list', keywords: keywords


    ScreeningsService.getScreenings().then (results)->
        $scope.screenings = results
        console.log results

    $scope.view = (screeningId)-> $state.go 'screenings.show' , id: screeningId

    $scope.newScreening = ()-> $state.go 'screenings.new'

    $scope.edit = (screeningId)-> $state.go 'screenings.edit' , id: screeningId

    $scope.delete = (screening)->
            ScreeningsService.deleteScreening(screening).then( ()-> $scope.back() )

])
