controllers = angular.module('controllers')

controllers .controller('UserRegisterController' , ['$scope', '$state', '$auth', 
    ($scope, $state, $auth) ->
    

        $scope.submitRegistration = (user) ->
            user.user_type_id = $scope.user_type;
            $auth.submitRegistration(user)
     

        $scope.$on('auth:registration-email-success' , (ev, message)->
            alert("A registration email was sent to " + message.email)
            $state.go 'movies.list'
            
        )

        $scope.$on('auth:registration-email-success' , (ev, message)->
            $scope.authErrors = reason.errors.full_messages
            $scope.errorsCount = $scope.authErrors.length
            
        );
])