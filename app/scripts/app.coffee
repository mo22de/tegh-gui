console.log "loaded"
@tegh = require("tegh-client-node")
path = require("path")
fs = require("fs")
_ = require("lodash")

# Dev tools
require('nw.gui').Window.get().showDevTools()

# Live reloading
_console = console
gui = require('nw.gui')
win = gui.Window.get()
Gaze = require("gaze")
new Gaze ["_public/js/app.js", "_public/css/app.css"], (err, gaze) ->
  gaze.on 'all', (event, filepath) ->
    _console.log "reloading"
    win.reload()

new Gaze ["_public/index.html"], (err, gaze) ->
  gaze.on 'all', (event, filepath) ->
    setTimeout ( -> win.reload() ), 400

# Dev: Autoload dev_null printer on localhost
# $ ->
#   mainScope.changePrinter
#     address: "192.168.1.102"
#     hostname: null
#     name: "printer_dev_null"
#     path: "/printers/printer_dev_null/"
#   $(".showPrintersBtn").click()

# Initializing the angular app
@teghApp = angular.module('teghApp', ['inflectionFilters'])

$sidePanelLinks = null

$ ->

  # $(".switch-small").bootstrapSwitch()
  # $('.temperature-panel .switch-small')
  # .bootstrapSwitch('setOnLabel', 'ON')
  # .bootstrapSwitch('setOffLabel', 'OFF')
  # console.log $('.temperature-panel .switch-small').length
  # console.log c.toString() for c in $('.temperature-panel').children()

  onResize()
  $(window).on "resize", onResize

onResize = ->
  $(".showPrintersBtn").height $(window).height()
  $(".showPrintersBtn .btn").css top: $(window).height()/2
