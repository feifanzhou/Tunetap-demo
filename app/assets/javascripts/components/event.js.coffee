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

Reaction.EventRoot = React.createClass
  render: ->
    event = null
    for e in events
      event = e if e.id == parseInt(@props.id, 10)
    # TODO: If no event, render 404
    artistCardClass = 'ArtistCard4'
    artistCardClass = 'ArtistCard2' if event.artist_ids.length <= 2
    artistCardClass = 'ArtistCard3' if event.artist_ids.length % 3 == 0
    artistCards = event.artist_ids.map( (aid) ->
      artist = null
      for a in artists
        artist = a if a.id == aid
      return if artist == null
      React.DOM.img
        className: 'EventArtistCard ' + artistCardClass
        style: { backgroundImage: 'url(' + artist.profilePhoto + ')' }
    )
    React.DOM.div
      children: [
        Shared.DemoDisclaimer()
        React.DOM.div
          className: 'container EventContainer'
          children:
            React.DOM.div
              className: 'row'
              children: [
                React.DOM.section
                  className: 'col-xs-12 col-sm-8'
                  children: [
                    React.DOM.h1
                      id: 'eventName'
                      children: event.name
                    React.DOM.p
                      id: 'eventTimeAndPlace'
                      children: event.time + ', ' + event.location
                    Shared.FundingProgress({ progressPercent: event.progress })
                    React.DOM.div
                      className: 'row'
                      id: 'tickets'
                      children: [
                        React.DOM.h2
                          className: 'col-xs-12'
                          children: 'Grab a ticket'
                        React.DOM.div
                          className: 'col-xs-6'
                          children: 
                            React.DOM.button
                              className: 'btn btn-primary'
                              children: [
                                React.DOM.h3
                                  className: 'TicketName'
                                  children: 'General admission'
                                React.DOM.p
                                  className: 'TicketPrice'
                                  children: '$10.00'
                              ]
                        React.DOM.div
                          className: 'col-xs-6'
                          children:
                            React.DOM.button
                              className: 'btn btn-primary'
                              children: [
                                React.DOM.h3
                                  className: 'TicketName'
                                  children: 'VIP package'
                                React.DOM.p
                                  className: 'TicketPrice'
                                  children: 'Name your price (min $20)'
                              ]
                      ]
                    React.DOM.p
                      children: 'Let your friends know! For every person that buys a ticket from your referral, you will receive $1 in credit, up to the price of your ticket'
                    React.DOM.p
                      children: 'No hidden charges or service fees. Once the transaction goes through, your tickets will immediately be available online and by email.'
                  ]
                React.DOM.section
                  className: 'col-xs-12 col-sm-4'
                  children: [
                    React.DOM.h2
                      children: 'Featuring'
                    React.DOM.div
                      children: artistCards
                    React.DOM.h2
                      children: 'People going'
                    React.DOM.div
                      children: 'People cards'
                  ]
              ]
      ]