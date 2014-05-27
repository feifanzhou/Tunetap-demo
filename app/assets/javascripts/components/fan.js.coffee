window.TD or= {}

demoString = 'This is an interactive demo. '
if Util.hasLocalStorage()
  demoString += 'Your changes will be saved, but they will not be reflected on the live site.'
else 
  demoString += "Your changes will not be saved because your browser doesn't support saving changes."
TD.DemoDisclaimer = React.createClass
  render: ->
    React.DOM.aside
      id: 'demoDisclaimer'
      children:
        React.DOM.p
          children: demoString
TD.TapThat = React.createClass
  render: ->
    React.DOM.section
      className: 'jumbotron'
      children:
        React.DOM.div
          className: 'container'
          children:
            React.DOM.div
              className: 'row'
              children:
                React.DOM.form
                  className: 'col-xs-12 form-inline text-center'
                  id: 'tapForm'
                  children: [
                    React.DOM.span
                      className: 'TapFormPrompt'
                      id: 'tapPrompt'
                      children: 'Tap'
                    React.DOM.input
                      className: 'form-control'
                      type: 'text'
                      placeholder: 'Artist'
                    React.DOM.span
                      className: 'TapFormPrompt'
                      id: 'forPrompt'
                      children: 'for'
                    React.DOM.input
                      className: 'form-control'
                      type: 'text'
                      placeholder: 'City'
                      defaultValue: 'New York City'
                  ]
TD.BrowseEvents = React.createClass
  render: ->
    React.DOM.section
      className: 'col-xs-12'
      children:
        React.DOM.div
          className: 'row'
          children: [
            React.DOM.section
              className: 'col-xs-12 col-sm-3'
              id: 'browseNavigator'
              children: [
                React.DOM.form
                  className: 'NavigatorSection'
                  id: 'navigatorSearchForm'
                  children:
                    React.DOM.input
                      className: 'form-control'
                      id: 'navigatorSearch'
                      type: 'search'
                      placeholder: 'Find events and artists'
                React.DOM.div
                  className: 'NavigatorSection'
                  children:
                    React.DOM.p
                      children: 'Events on tap'
                React.DOM.div
                  className: 'NavigatorSection'
                  children:
                    React.DOM.p
                      children: 'Confirmed events'
                React.DOM.div
                  className: 'NavigatorSection'
                  children:
                    React.DOM.p
                      children: 'Featured artists'
                React.DOM.div
                  className: 'NavigatorSection'
                  children:
                    React.DOM.p
                      children: 'Friends'
              ]
            React.DOM.section
              className: 'col-xs-12 col-sm-9'
              id: 'browseContent'
              children: 'Content'
          ]

Reaction.FanRoot = React.createClass
  render: ->
    React.DOM.div
      children: [
        TD.DemoDisclaimer()
        TD.TapThat()
        React.DOM.div
          className: 'container'
          children:
            React.DOM.div
              className: 'row'
              children: TD.BrowseEvents()
      ]