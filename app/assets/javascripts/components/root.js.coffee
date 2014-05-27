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
                  href: '/fan'
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
