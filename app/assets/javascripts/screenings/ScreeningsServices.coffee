services = angular.module('services');

services.factory('ScreeningsService', ['ScreeningsResource',  '$q',
    (ScreeningsResource , $q) ->

        getScreening: (id)->
                defered = $q.defer()
                ScreeningsResource.get({screeningId: id}).$promise.then (response)->  defered.resolve response
                defered.promise

        getScreenings: (keywords)->
                defered = $q.defer()
                ScreeningsResource.query( keywords: keywords).$promise.then (response)->  defered.resolve response
                defered.promise

        saveScreening: (screening)->
                defered = $q.defer()
                ScreeningsResource.save(screening).$promise.then (response)->  defered.resolve response
                defered.promise

        deleteScreening: (screening)->
                defered = $q.defer()
                ScreeningsResource.delete({screeningId: screening.id}).$promise.then (response)->  defered.resolve response
                defered.promise

        updateScreening: (screening)->
                defered = $q.defer()
                ScreeningsResource.update({screeningId: screening.id} ,screening).$promise.then (response)->  defered.resolve response
                defered.promise

])

services.factory('ScreeningsResource' , [ '$resource' ,
    ($resource) ->
     resoruce = $resource('/screenings/:screeningId', { screeningId: "@screeningId", format: 'json' } , {
            'update': { method:'PUT' }
            'get': {method: 'GET' , isArray: false}
        })
])
