controllers = angular.module('controllers')

controllers .controller('UserSessionController' , ['$scope', '$state', '$auth',     
    ($scope, $state, $auth) ->
     
        $scope.updateAccount = (user)->
            $auth.updateAccount(user);

        $scope.$on('auth:account-update-success' , (ev)->
            $scope.showSuccess = true
            $scope.successMessage = "Profile updated"
        )

        $scope.$on('auth:account-update-error' , (ev , reason)->
            $scope.showSuccess = false;
            $scope.successMessage = "Profile updated"
            if reason.errors.email
                $scope.authErrors = []
                $scope.authErrors.push("Email already taken")
                $scope.errorsCount = $scope.authErrors.length
            
        )

        $scope.$on('auth:login-success', (ev, reason)->
            $state.go('books.list')
        )

        $scope.$on('auth:login-error', (ev, reason) ->
          $scope.authErrors = reason.errors
          $scope.errorsCount = $scope.authErrors.length
        )

        $scope.$on('auth:logout-success', (ev) ->
          alert('goodbye')
          $state.go('books.list')
        )
])