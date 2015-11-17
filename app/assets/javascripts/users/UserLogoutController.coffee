controllers = angular.module('controllers')

controllers .controller('UserLogoutController' , ['$scope', '$state', '$auth', '$rootScope',
    ($scope, $state, $auth , $rootScope) ->

        $auth.signOut().then ()->
            $rootScope.loggedIn = false;


])
