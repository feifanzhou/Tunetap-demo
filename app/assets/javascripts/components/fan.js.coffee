window.TD or= {}

# Hack to make testing with npm work
if typeof require != 'undefined'
  React = require 'react'
  Reaction = require '../../../../vendor/assets/javascripts/reaction.js'
  window.Shared = require './_shared.js.coffee'
else
  React = window.React
  Reaction = window.Reaction

dylan = { name: 'Dylan Owen', profilePhoto: 'https://scontent-b-iad.xx.fbcdn.net/hphotos-ash3/t1.0-9/1969121_677884932255138_1459446033_n.jpg', tapCount: 42 }
reef = { name: 'Reef of Fortune', profilePhoto: 'https://scontent-b-iad.xx.fbcdn.net/hphotos-frc3/t1.0-9/428480_10151577933933570_1949326179_n.jpg', tapCount: 70 }
astrid = { name: 'Astrid Lundberg', profilePhoto: 'https://fbcdn-sphotos-c-a.akamaihd.net/hphotos-ak-frc3/t1.0-9/1653911_790732140942087_600888531_n.jpg', tapCount: 18 }
skizzy = { name: 'Skizzy Mars', profilePhoto: 'https://scontent-a-iad.xx.fbcdn.net/hphotos-ash3/t1.0-9/1184804_718856148144954_1944971323_n.jpg', tapCount: 247 }
blau = { name: '3LAU', profilePhoto: 'https://scontent-a-iad.xx.fbcdn.net/hphotos-prn1/t1.0-9/1621926_657666347612609_903799826_n.jpg', tapCount: 524 }
logic = { name: 'Logic', profilePhoto: 'https://scontent-b-iad.xx.fbcdn.net/hphotos-prn1/t1.0-9/532803_470548606304111_1258950956_n.jpg', tapCount: 498 }
kings = { name: 'Kings of the City', profilePhoto: 'https://scontent-a-iad.xx.fbcdn.net/hphotos-prn1/t1.0-9/1012372_10151668216408584_253838762_n.jpg', tapCount: 63 }
artists = [dylan, reef, blau, kings]

e1 = {
  name: 'Graduation recital'
  coverPhoto: 'https://scontent-a-iad.xx.fbcdn.net/hphotos-ash3/t1.0-9/10297904_10203623291284840_5421412255088603739_n.jpg'
  progress: 89.89
  friends: [4028, 382, 2389, 235, 988]
  moreFriends: 42
  peopleCount: 337
  location: '57 Water Way'
  time: 'Next Thursday, 7pm'
}
e2 = {
  name: 'Live at The Gates'
  coverPhoto: 'http://www.wallsave.com/wallpapers/1920x1080/skate/1018922/skate-music-concert-noise-jpg-1018922.jpg'
  progress: 55.0
  friends: [293, 85, 998, 50, 2983]
  moreFriends: 14
  peopleCount: 83
  location: 'The Gates'
  time: 'Next Friday, 10pm'
}
e3 = {
  name: 'East by Northeast'
  coverPhoto: 'http://sxsw.com/sites/default/files/news/image/outdoor%20stage%204_0.jpg'
  progress: 212
  friends: [498, 184, 371, 572, 96]
  moreFriends: 57
  peopleCount: 729
  location: 'Coney Island'
  time: 'June 12, all day'
}
events = [e1, e2]
confirmedEvents = [e3]

demoString = 'This is an interactive demo. '
if Util.hasLocalStorage()
  demoString += 'Your changes will be saved, but they will not be reflected on the live site.'
else 
  demoString += "Your changes will not be saved because your browser doesn't support saving changes."

TD.SearchResults = React.createClass
  render: ->
    React.DOM.div
      className: 'row'
      children:
        React.DOM.p
          className: 'col-xs-12 SearchResults'
          children: 'Search is currently not available in this demo. But you can probably imagine how it works :)'
TD.EventsOnTap = React.createClass
  render: ->
    React.DOM.div
      className: 'row'
      id: 'eventsOnTapContainer'
      children: events.map( (event) ->
        return Shared.EventCard({ event: event })
      )
TD.ConfirmedEvents = React.createClass
  render: ->
    React.DOM.div
      className: 'row'
      id: 'confirmedEventsContainer'
      children: confirmedEvents.map( (event) ->
        return Shared.EventCard({ event: event })
      )
TD.FeaturedArtists = React.createClass
  render: ->
    React.DOM.div
      className: 'row'
      id: 'featuredArtistsContainer'
      children: artists.map( (artist) ->
        return Shared.ArtistCard({ artist: artist })
      )
TD.FriendActivity = React.createClass
  render: ->
    React.DOM.div
      className: 'row'
      children:
        React.DOM.p
          className: 'col-xs-12 FriendResults'
          children: "We're working on this, but nothing here yet"
TD.DemoDisclaimer = React.createClass
  render: ->
    React.DOM.aside
      className: 'text-center'
      id: 'demoDisclaimer'
      children:
        React.DOM.p
          children: demoString
TD.ArtistList = React.createClass
  render: ->
    clickHandler = @props.didClickResult
    React.DOM.div
      className: 'col-xs-12 col-sm-10 col-sm-offset-1 TapArtistList'
      children:
        React.DOM.div
          className: 'row TapArtistContent'
          children: @props.artists.map( (artist) ->
            return Shared.ArtistCard({ artist: artist, shouldBeSmall: true, onClick: clickHandler })
          )
TD.TapThat = React.createClass
  getInitialState: ->
    return { isSearching: false, artistList: artists }
  startSearching: ->
    @setState({ isSearching: true })
  updateSearch: ->
    searchTerm = @refs.searchField.getDOMNode().value.trim().toLowerCase()
    if searchTerm.length == 0
      @setState({ artistList: artists })
      return
    filteredArtists = artists.filter( (artist) ->
      return artist.name.toLowerCase().indexOf(searchTerm) == 0
    )
    @setState({ artistList: filteredArtists })
  didClickResult: (e) ->
    @refs.searchField.getDOMNode().value = e.currentTarget.getAttribute('data-name')
    @updateSearch()
  render: ->
    children = [
      React.DOM.form
        className: 'col-xs-12 form-inline text-center'
        id: 'tapForm'
        children: [
          React.DOM.span
            className: 'TapFormPrompt'
            id: 'tapPrompt'
            children: 'Tap'
          React.DOM.input
            className: 'form-control TapArtistField'
            type: 'text'
            ref: 'searchField'
            id: 'searchField'
            onFocus: @startSearching
            onKeyUp: @updateSearch
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
          React.DOM.button
            className: 'btn btn-primary'
            id: 'tapButton'
            type: 'submit'
            children: 'Go!'
        ]
    ]
    if @state.isSearching
      children.push TD.ArtistList({ artists: @state.artistList, didClickResult: @didClickResult })
    React.DOM.section
      className: 'jumbotron'
      id: 'tapThatBlock'
      children:
        React.DOM.div
          className: 'container'
          children:
            React.DOM.div
              className: 'row'
              children: children
TD.BrowseEvents = React.createClass
  navigate: (event) ->
    target = event.target.getAttribute('data-target')
    @props.navigate(target)
  render: ->
    React.DOM.section
      className: 'col-xs-12'
      children:
        React.DOM.div
          className: 'row'
          id: 'browseEvents'
          children: [
            React.DOM.section
              className: 'col-xs-12 col-sm-3'
              id: 'browseNavigator'
              children:
                React.DOM.div
                  className: 'row'
                  children: [
                    React.DOM.form
                      className: 'NavigatorSection col-xs-12' + (if @props.nav == 'search' then ' Selected' else '')
                      onClick: @navigate
                      'data-target': 'search'
                      id: 'navigatorSearchForm'
                      children:
                        React.DOM.input
                          className: 'form-control'
                          onFocus: @navigate
                          'data-target': 'search'
                          id: 'navigatorSearch'
                          type: 'search'
                          placeholder: 'Find events and artists'
                    React.DOM.div
                      className: 'NavigatorSection col-xs-3 col-sm-12' + (if @props.nav == 'ontap' then ' Selected' else '')
                      id: 'eventsOnTap'
                      onClick: @navigate
                      'data-target': 'ontap'
                      children:
                        React.DOM.p
                          children: 'Events on tap'
                    React.DOM.div
                      className: 'NavigatorSection col-xs-3 col-sm-12' + (if @props.nav == 'confirmed' then ' Selected' else '')
                      id: 'confirmedEvents'
                      onClick: @navigate
                      'data-target': 'confirmed'
                      children:
                        React.DOM.p
                          children: 'Confirmed events'
                    React.DOM.div
                      className: 'NavigatorSection col-xs-3 col-sm-12' + (if @props.nav == 'feat' then ' Selected' else '')
                      id: 'featuredArtists'
                      onClick: @navigate
                      'data-target': 'feat'
                      children:
                        React.DOM.p
                          children: 'Featured artists'
                    React.DOM.div
                      className: 'NavigatorSection col-xs-3 col-sm-12' + (if @props.nav == 'friends' then ' Selected' else '')
                      id: 'friends'
                      onClick: @navigate
                      'data-target': 'friends'
                      children:
                        React.DOM.p
                          children: 'Friends'
                  ]
            React.DOM.section
              className: 'col-xs-12 col-sm-3'
              id: 'browseNavigatorSpacer'
              children: ''
            React.DOM.section
              className: 'BrowseContent col-xs-12 col-sm-9'
              id: 'browseContent'
              children: (if @props.nav == 'search'
                           TD.SearchResults()
                         else if @props.nav == 'ontap' 
                           TD.EventsOnTap() 
                         else if @props.nav == 'confirmed'
                           TD.ConfirmedEvents()
                         else if @props.nav == 'friends'
                           TD.FriendActivity()
                         else
                           TD.FeaturedArtists()
                        )
          ]

Reaction.FanRoot = React.createClass
  getInitialState: ->
    return { nav: 'ontap' }
  switchSections: (target) ->
    @setState({ nav: target })
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
              children: TD.BrowseEvents({ nav: @state.nav, navigate: @switchSections })
      ]
module.exports = {  # For testing use
  'FanRoot': Reaction.FanRoot
  'BrowseEvents': TD.BrowseEvents
} if typeof module != 'undefined'

navWidth = false
top = false  # Position of content from top of page
scrollAffix = ->
  tapThatBlock = document.getElementById('tapThatBlock')
  return if !tapThatBlock || typeof tapThatBlock == 'undefined'
  tapThatBlockHeight = document.getElementById('tapThatBlock').offsetHeight
  scrollTop = document.documentElement.scrollTop || document.body.scrollTop
  return if scrollTop < tapThatBlock  # Don't bother if not scrolled far enough

  navigator = document.getElementById('browseNavigator')
  content = document.getElementById('browseContent')
  navWidth or= window.getComputedStyle(navigator).width

  if !top  # Don't calculate top on every scroll frame — it doesn't change!
    top = { x: 0, y: 0 }
    e = content
    while e
      top.x += e.offsetLeft
      top.y += e.offsetTop
      e = e.offsetParent

  if top.y - scrollTop <= 14  
    navigator.className = navigator.className + ' Affix'
    navigator.style.width = navWidth
    document.getElementById('browseNavigatorSpacer').style.display = 'block'
  else 
    navigator.removeClass('Affix')
    document.getElementById('browseNavigatorSpacer').style.display = 'none'
window.onscroll = scrollAffix
scrollAffix()  # Make sure it fires on load