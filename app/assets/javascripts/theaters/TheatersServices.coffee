services = angular.module('services');

services.factory('TheatersService', ['TheatersResource',  '$q',
    (TheatersResource , $q) ->
        
        getTheater: (id)->
                defered = $q.defer()                 
                TheatersResource.get({theaterId: id}).$promise.then (response)->  defered.resolve response 
                defered.promise

        getTheaters: (keywords)->
                defered = $q.defer()
                TheatersResource.query().$promise.then (response)->  defered.resolve response 
                defered.promise
       
])

services.factory('TheatersResource' , [ '$resource' , 
    ($resource) ->
     resoruce = $resource('/theaters/:theaterId', { theaterId: "@theaterId", format: 'json' } , {
            'update': { method:'PUT' }
            'get': {method: 'GET' , isArray: false}
        })
])