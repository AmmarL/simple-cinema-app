services = angular.module('services');

services.factory 'UserService', () ->
    userObject = {}
    userObject.user = {}

    return  userObject
