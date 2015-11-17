cinema = angular.module('cinema');

cinema.config(['$stateProvider' , '$urlRouterProvider' ,
    ($stateProvider , $urlRouterProvider)->
        $stateProvider.state 'users',
            url: '/users'
            abstract: true
            template: '<div ui-view></div>'

        $stateProvider.state 'users.sign-in',
            url: '/sign-in'
            templateUrl: 'user_session/new.html'
            controller: 'UserSessionController'


        $stateProvider.state 'users.register',
            url: '/register',
            templateUrl: 'user_registration/new.html',
            controller: 'UserRegisterController',

        $stateProvider.state 'users.logout',
            url: '/logout',
            templateUrl: 'user_session/logout.html',
            controller: 'UserLogoutController'

        $stateProvider.state 'users.edit',
            url: '/edit',
            templateUrl: 'user_session/edit.html',
            controller: 'UserSessionController',
            resolve:
                auth: ($auth) ->
                    return $auth.validateUser()
                userTypes:
                    ['userTypesFactory', (userTypesFactory) -> return userTypesFactory.getUserTypes() ]

  ])
