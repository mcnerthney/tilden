'use strict'

describe 'Controller: MainCtrl', () ->

  # load the controller's module
  beforeEach(()->
    module('appApp.controllers')
    module('ui.bootstrap')
  )
  MainCtrl = {}
  scope = {}

  # Initialize the controller and a mock scope
  beforeEach inject ($injector, $controller, $rootScope) ->
    $httpBackend = $injector.get('$httpBackend')
    $httpBackend.whenGET(/.*/).respond({fake: 'data'})
    scope = $rootScope.$new()
    MainCtrl = $controller 'MainCtrl', {
      $scope: scope
    }
