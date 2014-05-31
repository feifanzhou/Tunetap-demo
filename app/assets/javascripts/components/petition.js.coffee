window.TD or= {}

# Hack to make testing with npm work
if typeof require != 'undefined'
  React = require 'react'
  Reaction = require '../../../../vendor/assets/javascripts/reaction.js'
  window.Shared = require './_shared.js.coffee'
else
  React = window.React
  Reaction = window.Reaction

