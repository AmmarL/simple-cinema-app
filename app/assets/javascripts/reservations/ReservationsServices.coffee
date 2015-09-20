services = angular.module('services');

services.factory('ReservationsService', ['ReservationsResource',  '$q',
    (ScreeningsResource , $q) ->

        saveReservation: (reservation)->
                defered = $q.defer()
                ScreeningsResource.save(reservation).$promise.then (response)->  defered.resolve response
                defered.promise

])


services.factory('ReservationsResource' , [ '$resource' ,
    ($resource) ->
     resoruce = $resource('/reservations/:reservationId', { reservationId: "@reservationId", format: 'json' } , {
            'update': { method:'PUT' }
            'get': {method: 'GET' , isArray: false}
        })
])
