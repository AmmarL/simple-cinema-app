cinema = angular.module('cinema');

cinema.config([ '$stateProvider', '$urlRouterProvider'
    ($stateProvider , $urlRouterProvider)->
        $urlRouterProvider.otherwise("/")
        $stateProvider.state 'screenings',
            url: ''
            abstract: true
            template: '<div ui-view></div>'

        $stateProvider.state 'screenings.list',
            url:  ''
            controller: 'ScreeningsController'
            templateUrl: 'screenings/list.html'

        $stateProvider.state 'screenings.new',
            url: 'screenings/new'
            controller: 'ScreeningController'
            templateUrl: 'screenings/form.html'

        $stateProvider.state 'screenings.edit',
            url: 'screenings/:id/edit'
            controller: 'ScreeningController'
            templateUrl: 'screenings/form.html'

        $stateProvider.state 'screenings.show',
            url: 'screenings/:id'
            controller: 'ScreeningController'
            templateUrl: 'screenings/show.html'

 ])
