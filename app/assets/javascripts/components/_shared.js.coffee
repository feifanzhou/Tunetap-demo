window.Shared or= {}

if typeof require != 'undefined'
  React = require 'react'
  Reaction = require '../../../../vendor/assets/javascripts/reaction.js'
else
  React = window.React
  Reaction = window.Reaction

demoString = 'This is an interactive demo. '
if Util.hasLocalStorage()
  demoString += 'Your changes will be saved, but they will not be reflected on the live site.'
else 
  demoString += "Your changes will not be saved because your browser doesn't support saving changes."
Shared.DemoDisclaimer = React.createClass
  render: ->
    React.DOM.aside
      className: 'text-center'
      id: 'demoDisclaimer'
      children:
        React.DOM.p
          children: demoString

Reaction.Error404 = React.createClass
  render: ->
    React.DOM.p
      children: '404 error'

Shared.FundingProgress = React.createClass
  render: ->
    cx = React.addons.classSet
    progressClass = cx({
      'progress-bar': true
      'progress-bar-success': @props.progressPercent >= 100
      'ProgressFill': true
    })
    React.DOM.div
      className: 'progress ProgressContainer'
      children:
        React.DOM.div
          className: progressClass
          role: 'progressbar'
          style: { width: @props.progressPercent + '%' }
          children:
            React.DOM.span
              className: 'sr-only'
              children: @props.progressPercent + '% funded'

window.Shared.ArtistCard = React.createClass
  render: ->
    cx = React.addons.classSet
    classes = cx({
      'ArtistCard': true,
      'DemoCard': true,
      'Small': @props.shouldBeSmall
      'col-xs-12': !@props.shouldBeSmall
      'col-xs-4': @props.shouldBeSmall
      'col-sm-6': !@props.shouldBeSmall
      'col-sm-3': @props.shouldBeSmall
      'col-md-4': !@props.shouldBeSmall
      'col-md-2': @props.shouldBeSmall
    })
    React.DOM.div
      className: classes
      'data-name': @props.artist.name
      'data-id': @props.artist.id
      onClick: @props.onClick
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
                React.DOM.a
                  className: 'btn btn-default ArtistCardMoreButton'
                  role: 'button'
                  href: '/artist/' + @props.artist.id
                  children: 'Find out more'
                React.DOM.button
                  className: 'btn btn-primary ArtistCardTapButton'
                  children: 'Tap'
                  'data-artist-name': @props.artist.name
                  onClick: @props.tapAction
              ]
          ]
Shared.EventCard = React.createClass
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
                React.DOM.h2
                  className: 'DemoCardSubname col-xs-12'
                  children: if @props.artistNames && typeof @props.artistNames != 'undefined' then 'Feat. ' + @props.artistNames else ''
                React.DOM.div
                  className: 'EventCardProgress col-xs-12'
                  children: Shared.FundingProgress({ progressPercent: @props.event.progress })
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
                    React.DOM.a
                      className: 'btn btn-primary EventCardTicketButton'
                      role: 'button'
                      href: '/event/' + @props.event.id
                      children: 'Grab a ticket'
              ]
          ]
Shared.PetitionCard = React.createClass
  render: ->
    React.DOM.div
      className: 'PetitionCard DemoCard col-xs-12 col-sm-6 col-md-4'
      children:
        React.DOM.div
          className: 'DemoCardContent'
          children: [
            React.DOM.div
              className: 'DemoCardBody row'
              children: [
                React.DOM.h2
                  className: 'DemoCardName col-xs-12'
                  children: @props.petition.artist + ' for ' + @props.petition.city
                React.DOM.p
                  className: 'DemoCardSubname col-xs-12'
                  children: 'Unconfirmed'
                React.DOM.p
                  className: 'EventCardPeopleCount col-xs-12'
                  children: @props.petition.count + ' people supporting this petition so far'
                React.DOM.div
                  className: 'col-xs-12'
                  children:
                    React.DOM.button
                      className: 'btn btn-primary PetitionCardActionButton'
                      'data-petition-id': @props.petition.id
                      onClick: @props.supportPetition
                      children: 'Support this petition'
              ]
          ]

module.exports = window.Shared if typeof module != 'undefined'