window.TD or= {}

TD.FundingProgress = React.createClass
  render: ->
    React.DOM.div
      className: 'progress ProgressContainer'
      children:
        React.DOM.div
          className: 'progress-bar progress-bar-success ProgressFill'
          role: 'progressbar'
          style: { width: @props.progressPercent + '%' }
          children:
            React.DOM.span
              className: 'sr-only'
              children: @props.progressPercent + '% funded'

TD.ArtistCard = React.createClass
  render: ->
    React.DOM.div
      className: 'ArtistCard DemoCard col-xs-12 col-sm-6 col-md-4'
      children:
        React.DOM.div
          className: 'DemoCardContent'
          children: [
            React.DOM.img
              className: 'DemoCardPhoto'
              style: { backgroundImage: 'url(' + @props.artist.profilePhoto + ')' }
            React.DOM.div
              className: 'DemoCardBody'
              children: [
                React.DOM.h2
                  className: 'DemoCardName'
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
    friendsGoing =  @props.event.friends.map( (friend) ->
                      return React.DOM.img
                        className: 'ProfilePictureSmall col-xs-2'
                        src: 'https://graph.facebook.com/' + friend + '/picture'
                    )
    friendsGoing.push(React.DOM.div
                        className: 'FriendGoingMoreCount col-xs-2'
                        children: [
                          React.DOM.span
                            children: '+' + @props.event.moreFriends + ' more'
                        ]
                     )
    React.DOM.div
      className: 'EventCard DemoCard col-xs-12 col-sm-6 col-md-4'
      children:
        React.DOM.div
          className: 'DemoCardContent'
          children: [
            React.DOM.img
              className: 'DemoCardPhoto'
              style: { backgroundImage: 'url(' + @props.event.coverPhoto + ')' }
            React.DOM.div
              className: 'DemoCardBody row'
              children: [
                React.DOM.h2
                  className: 'DemoCardName col-xs-12'
                  children: @props.event.name
                React.DOM.div
                  className: 'EventCardProgress col-xs-12'
                  children: TD.FundingProgress({ progressPercent: @props.event.progress })
                React.DOM.div
                  className: 'EventCardPeople col-xs-12'
                  children: [
                    React.DOM.div
                      className: 'EventCardFriendsGoing row'
                      children: friendsGoing
                    React.DOM.p
                      className: 'EventCardPeopleCount'
                      children: [
                        React.DOM.strong
                          children: @props.event.peopleCount + ' going'
                        ' including '
                        React.DOM.strong
                          children: (@props.event.moreFriends + 5) + ' friends'
                      ]
                  ]
                React.DOM.div
                  className: 'EventCardLogistics col-xs-12'
                  children: [
                    React.DOM.p
                      className: 'EventCardLocation'
                      children: @props.event.location
                    React.DOM.p
                      className: 'EventCardDate'
                      children: @props.event.time
                  ]
                React.DOM.div
                  className: 'col-xs-12'
                  children:
                    React.DOM.button
                      className: 'btn btn-primary EventCardTicketButton'
                      children: 'Grab a ticket'
              ]
          ]