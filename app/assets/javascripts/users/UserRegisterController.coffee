controllers = angular.module('controllers')

controllers .controller('UserRegisterController' , ['$scope', '$state', '$auth',
    ($scope, $state, $auth) ->


        $scope.submitRegistration = (user) ->
            $auth.submitRegistration(user)


        $scope.$on 'auth:registration-email-success' , (ev, message)->
            alert("A registration email was sent to " + message.email)
            $state.go 'screenings.list'



        $scope.$on 'auth:registration-email-error' , (ev, reason)->
            $scope.authErrors = reason.errors.full_messages
            $scope.errorsCount = $scope.authErrors.length

])
