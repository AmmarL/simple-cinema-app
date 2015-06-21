(function() {
  var directive = function() {
    return {
      restrict: 'E',
      templateUrl: 'directives/authorisation-errors.html',
      transclude: false,
      scope: false
    };
  };

  angular.module('cinema').directive('authorisationErrors', directive);
}());
