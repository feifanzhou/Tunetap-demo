window.TD or= {}

TD.VenueEventBanner = React.createClass
  render: ->
    React.DOM.div
      className: 'col-sm-12 EventBanner'
      children: [
        React.DOM.div
          className: 'EventDetailsBackground EventDetailsBlur'
        React.DOM.div
          className: 'EventDetailsBackground EventDetailsDarken'
        React.DOM.div
          className: 'col-sm-6 EventDetails'
          children: [
            React.DOM.h2
              className: 'EventName'
              children: 'A need for speed'
            React.DOM.p
              className: 'EventPerformers'
              children: 'Feat Maverick and Goose'
          ]
        React.DOM.div
          className: 'col-sm-3 col-sm-offset-3 EventTickets text-right'
          children: [
            React.DOM.p
              className: 'CheckTicketsLink'
              children: 'Check tickets'
          ]
      ]
TD.VenueTonight = React.createClass
  render: ->
    React.DOM.div
      className: 'col-sm-12'
      id: 'venueTonight'
      children: [
        TD.VenueEventBanner()
        TD.VenueEventBanner()
      ]
TD.VenueRoot = React.createClass
  render: ->
    React.DOM.div
      className: 'container'
      children: [
        React.DOM.div
          className: 'row'
          children: [
            React.DOM.div
              className: 'col-sm-4'
              children: [
                React.DOM.div
                  id: 'venueBasicInfo'
                  children: [
                    React.DOM.h1
                      id: 'venueName'
                      children: 'The Gates'
                    React.DOM.p
                      id: 'venuePhone'
                      children: '(401) 680-0897'
                    React.DOM.p
                      id: 'venueEmail'
                      children: 'thegates@tunetap.com'
                    React.DOM.p
                      id: 'venueAddress'
                      children: [
                        '325 College Ave'
                        React.DOM.br
                        'Ithaca, NY 14853'
                      ]
                  ]
                React.DOM.div
                  className: 'list-group'
                  children: [
                    React.DOM.a
                      className: 'list-group-item active'
                      children: [
                        React.DOM.span
                          className: 'badge'
                          children: '2'
                        React.DOM.span
                          children: 'Tonight'
                      ]
                      href: '#tonight'
                      onClick: ->
                        React.renderComponent(TD.VenueTonight(), document.getElementById('venueDetails'))
                    React.DOM.a
                      className: 'list-group-item'
                      children: 'Upcoming'
                      href: '#'
                    React.DOM.a
                      className: 'list-group-item'
                      children: [
                        React.DOM.span
                          className: 'badge'
                          children: '4'
                        React.DOM.span
                          children: 'Requests'
                      ]
                      href: '#'
                    React.DOM.a
                      className: 'list-group-item'
                      children: 'Settings'
                      href: '#'
                  ]
              ]
            React.DOM.div
              className: 'col-sm-8'
              id: 'venueDetails'
              children: TD.VenueTonight()
          ]
      ]