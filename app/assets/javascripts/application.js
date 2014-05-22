// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require reaction
// require_tree .
//= require react.full
//= require_tree ./components
// require _init

// Reaction.Error404 = React.createClass({
//   render: function() {
//     return React.DOM.p({
//       children: '404'
//     })
//   }
// })
// Reaction.RootComponent = React.createClass({
//   render: function() {
//     return React.DOM.div({
//       children: [
//         React.DOM.a({
//           href: '/about',
//           children: 'Go to about'
//         }),
//         React.DOM.a({
//           href: '/id/1/15',
//           children: 'ID 1'
//         })
//       ]
//     });
//   }
// });
// Reaction.AboutComponent = React.createClass({
//   render: function() {
//     return React.DOM.a({
//       href: '/',
//       children: 'Go home'
//     });
//   }
// });
// Reaction.IDComponent = React.createClass({
//   render: function() {
//     return React.DOM.p({
//       children: 'ID Component ' + this.props.id + ', ' + this.props.id2
//     });
//   }
// });

Reaction.Router.initialize({
  '/': 'Root',
  '/venue': 'VenueRoot',
  '/id/:id/:id2': 'IDComponent'
}, document.getElementById('root'))