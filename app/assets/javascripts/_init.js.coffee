window.TD or= {}

# Rendering
render_fan = ->
  window.history.pushState({}, "Fan Demo | Tunetap", '/fan')
  render('fan')
render_artist = ->
  window.history.pushState({}, "Artist Demo | Tunetap", '/artist')
  render('artist')
render_venue = ->
  console.log('Render venue')
  window.history.pushState({}, "Venue Demo | Tunetap", '/venue')
  render('venue')
render = (arg) ->
  console.log('Render: ' + arg)
  target = document.getElementById('content')
  role_children = { render_fan: render_fan, render_artist: render_artist, render_venue: render_venue }
  if arg == 'root'
    React.renderComponent(TD.Root(role_children), target)
  else if arg == 'fan'
    React.renderComponent(TD.FanRoot(role_children), target)
  else if arg == 'artist'
    React.renderComponent(TD.ArtistRoot(role_children), target)
  else if arg == 'venue'
    React.renderComponent(TD.VenueRoot(role_children), target)
  else render_404()
render_404 = -> React.renderComponent(TD.Error404(), document.getElementById('content'))

# Routing
pathname = window.location.pathname.slice(1)
if pathname.length < 1
  render('root')
else if pathname == 'fan' || pathname == 'artist' || pathname == 'venue'
  render(pathname)
else render_404()
popped = ('state' in window.history)
initialURL = location.href
$(window).bind('popstate', (event) ->
  initialPop = !popped && location.href == initialURL
  popped = true
  return if initialPop
  render('root')
)