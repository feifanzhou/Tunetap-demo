window.TD or= {}

# Hack to make testing with npm work
if typeof require != 'undefined'
  React = require 'react'
  Reaction = require '../../../../vendor/assets/javascripts/reaction.js'
  window.Shared = require './_shared.js.coffee'
else
  React = window.React
  Reaction = window.Reaction

dylan = { id: 1, name: 'Dylan Owen', profilePhoto: 'https://scontent-b-iad.xx.fbcdn.net/hphotos-ash3/t1.0-9/1969121_677884932255138_1459446033_n.jpg', tapCount: 42, bkg: 'dylan_right.jpg' }
reef = { id: 2, name: 'Reef of Fortune', profilePhoto: 'https://scontent-b-iad.xx.fbcdn.net/hphotos-frc3/t1.0-9/428480_10151577933933570_1949326179_n.jpg', tapCount: 70, bkg: 'reef.jpg' }
astrid = { id: 3, name: 'Astrid Lundberg', profilePhoto: 'https://fbcdn-sphotos-c-a.akamaihd.net/hphotos-ak-frc3/t1.0-9/1653911_790732140942087_600888531_n.jpg', tapCount: 18 }
skizzy = { id: 4, name: 'Skizzy Mars', profilePhoto: 'https://scontent-a-iad.xx.fbcdn.net/hphotos-ash3/t1.0-9/1184804_718856148144954_1944971323_n.jpg', tapCount: 247 }
blau = { id: 5, name: '3LAU', profilePhoto: 'https://scontent-a-iad.xx.fbcdn.net/hphotos-prn1/t1.0-9/1621926_657666347612609_903799826_n.jpg', tapCount: 524, bkg: '3lau.jpg' }
logic = { id: 6, name: 'Logic', profilePhoto: 'https://scontent-b-iad.xx.fbcdn.net/hphotos-prn1/t1.0-9/532803_470548606304111_1258950956_n.jpg', tapCount: 498 }
kings = { id: 7, name: 'Kings of the City', profilePhoto: 'https://scontent-a-iad.xx.fbcdn.net/hphotos-prn1/t1.0-9/1012372_10151668216408584_253838762_n.jpg', tapCount: 63, bkg: 'kings.jpg' }
artists = [dylan, reef, blau, kings]

e1 = {
  id: 1
  name: 'Graduation recital'
  artist_ids: []
  coverPhoto: 'https://scontent-a-iad.xx.fbcdn.net/hphotos-ash3/t1.0-9/10297904_10203623291284840_5421412255088603739_n.jpg'
  progress: 89.89
  friends: [4028, 382, 2389, 235, 988]
  moreFriends: 42
  peopleCount: 337
  location: '57 Water Way'
  time: 'Next Thursday, 7pm'
}
e2 = {
  id: 2
  name: 'Live at The Gates'
  artist_ids: [1]
  coverPhoto: 'http://www.wallsave.com/wallpapers/1920x1080/skate/1018922/skate-music-concert-noise-jpg-1018922.jpg'
  progress: 55.0
  friends: [293, 85, 998, 50, 2983]
  moreFriends: 14
  peopleCount: 83
  location: 'The Gates'
  time: 'Next Friday, 10pm'
}
e3 = {
  id: 3
  name: 'East by Northeast'
  artist_ids: [2, 7]
  coverPhoto: 'http://sxsw.com/sites/default/files/news/image/outdoor%20stage%204_0.jpg'
  progress: 212
  friends: [498, 184, 371, 572, 96]
  moreFriends: 57
  peopleCount: 729
  location: 'Coney Island'
  time: 'June 12, all day'
}
events = [e1, e2, e3]

TD.ArtistEvent = React.createClass
  render: ->
    React.DOM.a
      className: 'ArtistEventLink'
      href: '/event/' + @props.event.id
      children:
        React.DOM.div
          className: 'ArtistEvent'
          children: [
            React.DOM.h2
              className: 'EventName'
              children: @props.event.name
            React.DOM.p
              className: 'EventDetails'
              children: @props.event.time + ' | ' + @props.event.peopleCount + ' going including ' + @props.event.moreFriends + ' friends'
            React.DOM.div
              className: 'EventProgress'
              children: Shared.FundingProgress({ progressPercent: @props.event.progress })
          ]

Reaction.ArtistRoot = React.createClass
  render: ->
    artist = null
    (artist = a if a.id == parseInt(@props.id)) for a in artists
    artistEvents = []
    for e in events
      artistEvents.push(e) if e.artist_ids.indexOf(artist.id) >= 0
    eventEntries = artistEvents.map (event) -> TD.ArtistEvent({ event: event })
    React.DOM.div
      children: [
        Shared.DemoDisclaimer()
        React.DOM.div
          id: 'artistContent'
          children: [
            React.DOM.div
              id: 'bkg'
              style: { backgroundImage: 'url(/assets/' + artist.bkg + ')' }
            React.DOM.div
              id: 'bkgGrad'
            React.DOM.div
              className: 'container'
              id: 'artistContainer'
              children:
                React.DOM.div
                  className: 'row'
                  children: [
                    React.DOM.div
                      className: 'col-xs-12 col-sm-6'
                      id: 'artistDetails'
                      children: [
                        React.DOM.div
                          className: 'row'
                          id: 'artistProfile'
                          children: [
                            React.DOM.div
                              className: 'col-xs-3'
                              id: 'artistPhotoContainer'
                              children: 
                                React.DOM.img
                                  id: 'artistPhoto'
                                  style: { backgroundImage: 'url(' + artist.profilePhoto + ')' }
                            React.DOM.div
                              className: 'col-xs-9'
                              children: [
                                React.DOM.h1
                                  id: 'artistName'
                                  children: artist.name
                                React.DOM.p
                                  id: 'artistCity'
                                  children: 'New York City'
                                React.DOM.p
                                  id: 'artistSocial'
                                  children: 'Twitter | Instagram | Facebook'
                              ]
                          ]
                        React.DOM.div
                          className: 'row'
                          children: 
                            React.DOM.div
                              className: 'col-xs-12'
                              children:
                                React.DOM.p
                                  id: 'artistDescription'
                                  children: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veniam, ratione, doloribus quos enim voluptas harum fugit molestias ipsam maiores aspernatur distinctio iusto nostrum fugiat provident maxime obcaecati repellendus placeat repellat?'
                        React.DOM.div
                          className: 'row'
                          children:
                            React.DOM.div
                              className: 'col-xs-12'
                              children: 'Sounds'
                      ]
                    React.DOM.div
                      className: 'col-xs-12 col-sm-6'
                      id: 'eventDetails'
                      children: [
                        React.DOM.h1
                          id: 'eventHeading'
                          children: 'Events'
                        React.DOM.div
                          children: eventEntries
                      ]
                  ]
          ]
      ]