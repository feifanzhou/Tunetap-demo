window.TD or= {}

TD.ArtistCard = React.createClass
  render: ->
    React.DOM.div
      className: 'ArtistCard col-xs-12 col-sm-6 col-md-4'
      children:
        React.DOM.div
          className: 'ArtistCardContent'
          children: [
            React.DOM.img
              className: 'ArtistCardPhoto'
              style: { backgroundImage: 'url(' + @props.artist.profilePhoto + ')' }
            React.DOM.div
              className: 'ArtistCardBody'
              children: [
                React.DOM.h2
                  className: 'ArtistCardName'
                  children: @props.artist.name
                React.DOM.p
                  className: 'ArtistCardTapCount'
                  children: 'Tapped ' + @props.artist.tapCount + ' times'
                React.DOM.button
                  className: 'btn btn-default ArtistCardMoreButton'
                  children: 'Find out more'
                React.DOM.button
                  className: 'btn btn-primary ArtistCardTapButton'
                  children: 'Tap'
              ]
          ]

TD.EventCard = React.createClass
  render: ->
    React.DOM.div
      className: 'EventCard col-xs-12 col-sm-4'
      children: [
        React.DOM.p
          children: 'Event card'
      ]