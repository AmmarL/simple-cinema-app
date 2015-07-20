cinema = angular.module('cinema');

cinema.config([ '$stateProvider', '$urlRouterProvider'
    ($stateProvider , $urlRouterProvider)->
        $urlRouterProvider.otherwise("/")
        $stateProvider.state 'movies',
            url: '/movies'
            abstract: true
            template: '<div ui-view></div>'

        $stateProvider.state 'movies.list',
            url:  '?keywords'
            controller: 'MoviesController'
            templateUrl: 'index.html'

        $stateProvider.state 'movies.new',
            url: '/new'
            controller: 'MovieController'
            templateUrl: 'movies/form.html'

        $stateProvider.state 'movies.edit',
            url: '/:id/edit'
            controller: 'MovieController'
            templateUrl: 'movies/form.html'

        $stateProvider.state 'movies.show',
            url: '/:id'
            controller: 'MovieController'
            templateUrl: 'movies/show.html'
 ])
