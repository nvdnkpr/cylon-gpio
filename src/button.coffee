###
 * Cylon button driver
 * http://cylonjs.com
 *
 * Copyright (c) 2013 The Hybrid Group
 * Licensed under the Apache 2.0 license.
###

'use strict';
namespace = require 'node-namespace'

namespace "Cylon.Driver.GPIO", ->
  class @Button
    constructor: (opts) ->
      @self = this
      @device = opts.device
      @connection = @device.connection
      @pin = @device.pin
      @isPressed = false

    commands: ->
      ['isPressed']

    start: (callback) ->
      Logger.debug "LED on pin #{@pin} started"
      @connection.digitalRead @pin, (data) =>
        if data is 1
          @isPressed = true
          @emit 'pushed'
        else
          @isPressed = false
          @emit 'released'

      (callback)(null)
