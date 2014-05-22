Reaction.Root = React.createClass
  render: ->
    React.DOM.div
      className: 'container'
      children: [
        React.DOM.div
          className: 'row page-header'
          children: [
            React.DOM.h1
              children: 'Tunetap demo'
            React.DOM.p
              children: 'Select a role to get started'
          ]
        React.DOM.div
          className: 'row'
          children: [
            React.DOM.div
              className: 'col-sm-4'
              children: 
                React.DOM.a
                  className: 'btn btn-default col-sm-10 col-sm-offset-1'
                  children: 'Fan'
                  roll: 'button'
            React.DOM.div
              className: 'col-sm-4'
              children: 
                React.DOM.a
                  className: 'btn btn-default col-sm-10 col-sm-offset-1'
                  children: 'Artist'
                  roll: 'button'
            React.DOM.div
              className: 'col-sm-4'
              children: 
                React.DOM.a
                  className: 'btn btn-default col-sm-10 col-sm-offset-1'
                  children: 'Venue'
                  href: '/venue'
                  roll: 'button'
          ]
      ]
TD.FanRoot = React.createClass
  render: ->
    React.DOM.p
      children: 'Fan root'
TD.ArtistRoot = React.createClass
  render: ->
    React.DOM.p
      children: 'Artist root'
