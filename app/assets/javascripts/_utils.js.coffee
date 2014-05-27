window.Util or= {}

Util.hasLocalStorage = ->
  return typeof(Storage) != `void(0)` || typeof(Storage) != 'undefined'

HTMLElement::removeClass = (remove) ->
  newClassName = ""
  i = undefined
  classes = @className.split(" ")
  i = 0
  while i < classes.length
    newClassName += classes[i] + " "  if classes[i] isnt remove
    i++
  @className = newClassName
  return