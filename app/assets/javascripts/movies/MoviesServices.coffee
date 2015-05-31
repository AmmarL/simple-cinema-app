services = angular.module('services');

services.factory('MoviesService', ['MoviesResource',  '$q',
    (MoviesResource , $q) ->
        
        getMovie: (id)->
                defered = $q.defer()                 
                MoviesResource.get({movieId: id}).$promise.then (response)->  defered.resolve response 
                defered.promise

        getMovies: (keywords)->
                defered = $q.defer()
                MoviesResource.query( keywords: keywords).$promise.then (response)->  defered.resolve response 
                defered.promise

        saveMovie: (movie)->
                defered = $q.defer()
                MoviesResource.save(movie).$promise.then (response)->  defered.resolve response 
                defered.promise

        deleteMovie: (movie)->
                defered = $q.defer() 
                MoviesResource.delete({movieId: movie.id}).$promise.then (response)->  defered.resolve response 
                defered.promise

        updateMovie: ()-> 
                defered = $q.defer()
                MoviesResource.$update(movie).$promise.then (response)->  defered.resolve response 
                defered.promise
        
])

services.factory('MoviesResource' , [ '$resource' , 
    ($resource) ->
     resoruce = $resource('/movies/:movieId', { movieId: "@movieId", format: 'json' } , {
            'update': { method:'PUT' }
            'get': {method: 'GET' , isArray: false}
        })
])