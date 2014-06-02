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

Reaction.ArtistRoot = React.createClass
  render: ->
    artist = null
    (artist = a if a.id == parseInt(@props.id)) for a in artists
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
                  children: 'Event details'
              ]
      ]