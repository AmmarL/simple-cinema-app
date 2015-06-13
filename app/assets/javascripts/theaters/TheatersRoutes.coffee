cinema = angular.module('cinema');

cinema.config([ '$stateProvider', '$urlRouterProvider'
    ($stateProvider , $urlRouterProvider)->
        $urlRouterProvider.otherwise("/")
        $stateProvider.state 'theaters', 
            url: '/theaters'
            abstract: true
            template: '<div ui-view></div>' 

        $stateProvider.state 'theaters.list',
            url:  ''
            controller: 'TheatersController'
            templateUrl: 'theaters/list.html'

        $stateProvider.state 'theaters.show',
            url: '/:id'
            controller: 'TheaterController'
            templateUrl: 'theaters/show.html'

 ])