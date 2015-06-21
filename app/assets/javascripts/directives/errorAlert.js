(function() {
  var directive = function() {
    return {
      restrict: 'E',
      templateUrl: 'directives/error-alert.html',
      transclude: false,
      scope: false
    };
  };

  angular.module('cinema').directive('errorAlert', directive);
}());
