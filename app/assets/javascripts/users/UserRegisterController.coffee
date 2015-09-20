controllers = angular.module('controllers')

controllers .controller('UserRegisterController' , ['$scope', '$state', '$auth',
    ($scope, $state, $auth) ->


        $scope.submitRegistration = (user) ->
            $auth.submitRegistration(user).then ()-> $auth.submitLogin {email : user.email , password: user.password}


        $scope.$on 'auth:registration-email-success' , (ev, message)->
            $state.go 'screenings.list'



        $scope.$on 'auth:registration-email-error' , (ev, reason)->
            $scope.authErrors = reason.errors.full_messages
            $scope.errorsCount = $scope.authErrors.length

])
