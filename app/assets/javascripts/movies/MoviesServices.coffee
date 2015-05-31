services = angular.module('services');

services.factory('MoviesService', ['MoviesResource',  '$q',
    (MoviesResource , $q) ->
        
        getMovie: (id)->                 
                MoviesResource.get({movieId: id})

        getMovies: (keywords)->
                MoviesResource.query( keywords: keywords)

        saveMovie: (movie)->
                console.log movie
                MoviesResource.save(movie)

        deleteMovie: (movie)-> 
                MoviesResource.delete(movie)

        updateMovie: ()-> 
                MoviesResource.$update(movie)
        
])

services.factory('MoviesResource' , [ '$resource' , 
    ($resource) ->
     resoruce = $resource('/movies/:movieId', { movieId: "@movieId", format: 'json' } , {
            'update': { method:'PUT' }
            'get': {method: 'GET' , isArray: false}
        })
])