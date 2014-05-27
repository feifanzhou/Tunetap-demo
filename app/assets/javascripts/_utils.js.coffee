window.Util or= {}

Util.hasLocalStorage = ->
  return typeof(Storage) != `void(0)` || typeof(Storage) != 'undefined'