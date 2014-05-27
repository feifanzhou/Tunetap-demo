window.TD or= {}

dylan = { name: 'Dylan Owen', profilePhoto: 'https://scontent-b-iad.xx.fbcdn.net/hphotos-ash3/t1.0-9/1969121_677884932255138_1459446033_n.jpg', tapCount: 42 }
reef = { name: 'Reef of Fortune', profilePhoto: 'https://scontent-b-iad.xx.fbcdn.net/hphotos-frc3/t1.0-9/428480_10151577933933570_1949326179_n.jpg', tapCount: 70 }
astrid = { name: 'Astrid Lundberg', profilePhoto: 'https://fbcdn-sphotos-c-a.akamaihd.net/hphotos-ak-frc3/t1.0-9/1653911_790732140942087_600888531_n.jpg', tapCount: 18 }
skizzy = { name: 'Skizzy Mars', profilePhoto: 'https://scontent-a-iad.xx.fbcdn.net/hphotos-ash3/t1.0-9/1184804_718856148144954_1944971323_n.jpg', tapCount: 247 }
blau = { name: '3LAU', profilePhoto: 'https://scontent-a-iad.xx.fbcdn.net/hphotos-prn1/t1.0-9/1621926_657666347612609_903799826_n.jpg', tapCount: 524 }
logic = { name: 'Logic', profilePhoto: 'https://scontent-b-iad.xx.fbcdn.net/hphotos-prn1/t1.0-9/532803_470548606304111_1258950956_n.jpg', tapCount: 498 }
kings = { name: 'Kings of the City', profilePhoto: 'https://scontent-a-iad.xx.fbcdn.net/hphotos-prn1/t1.0-9/1012372_10151668216408584_253838762_n.jpg', tapCount: 63 }
artists = [dylan, reef, astrid, skizzy, blau, logic, kings]

demoString = 'This is an interactive demo. '
if Util.hasLocalStorage()
  demoString += 'Your changes will be saved, but they will not be reflected on the live site.'
else 
  demoString += "Your changes will not be saved because your browser doesn't support saving changes."

TD.FeaturedArtists = React.createClass
  render: ->
    React.DOM.div
      className: 'row'
      id: 'featuredArtistsContainer'
      children: artists.map( (artist) ->
        return TD.ArtistCard({ artist: artist })
      )
TD.DemoDisclaimer = React.createClass
  render: ->
    React.DOM.aside
      className: 'text-center'
      id: 'demoDisclaimer'
      children:
        React.DOM.p
          children: demoString
TD.TapThat = React.createClass
  render: ->
    React.DOM.section
      className: 'jumbotron'
      id: 'tapThatBlock'
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
                    React.DOM.button
                      className: 'btn btn-primary'
                      id: 'tapButton'
                      type: 'submit'
                      children: 'Go!'
                  ]
TD.BrowseEvents = React.createClass
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
                      className: 'NavigatorSection col-xs-12'
                      id: 'navigatorSearchForm'
                      children:
                        React.DOM.input
                          className: 'form-control'
                          id: 'navigatorSearch'
                          type: 'search'
                          placeholder: 'Find events and artists'
                    React.DOM.div
                      className: 'NavigatorSection col-xs-3 col-sm-12'
                      id: 'eventsOnTap'
                      children:
                        React.DOM.p
                          children: 'Events on tap'
                    React.DOM.div
                      className: 'NavigatorSection col-xs-3 col-sm-12'
                      id: 'confirmedEvents'
                      children:
                        React.DOM.p
                          children: 'Confirmed events'
                    React.DOM.div
                      className: 'NavigatorSection Selected col-xs-3 col-sm-12'
                      id: 'featuredArtists'
                      children:
                        React.DOM.p
                          children: 'Featured artists'
                    React.DOM.div
                      className: 'NavigatorSection col-xs-3 col-sm-12'
                      id: 'friends'
                      children:
                        React.DOM.p
                          children: 'Friends'
                  ]
            React.DOM.section
              className: 'col-xs-12 col-sm-3'
              id: 'browseNavigatorSpacer'
              children: ''
            React.DOM.section
              className: 'col-xs-12 col-sm-9'
              id: 'browseContent'
              children: TD.FeaturedArtists()
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