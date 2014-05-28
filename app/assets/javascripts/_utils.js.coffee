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

# http://stackoverflow.com/questions/9178174/find-all-text-nodes
# Seems to exceed call stack, doesn't work :()
Util.elementHasText = (el, text) ->
  helper = -> # To address possible scoping issues?
    return true if (el.nodeType == Node.TEXT_NODE && el.nodeValue.trim() != '' && el.nodeValue == text)
    if el.childNodes.length <= 0
      return false
    else
      i = 0
      while i < el.childNodes.length
        helper el.childNodes[i]
        i++
  return helper()


module.exports = window.Util if typeof module != 'undefined'