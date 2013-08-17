'use strict';

angular.module('appApp.services', [])
  .factory 'ApiGet', ['$http', ($http) ->
    congress: (path, callback, context) ->
      args = Array.prototype.slice.call(arguments, 2)
      context = args.shift()
      $http
        url: "http://congress.api.sunlightfoundation.com/#{path}&apikey=XXXX"
        method: "GET"
      .success (data, status, headers, config)->
        args.unshift data.results
        args.unshift null
        callback.apply(context, args)
      .error (data, status, headers, config) ->
        callback "Error pulling #{path} from Sunlight Congress API.", null
  ]
