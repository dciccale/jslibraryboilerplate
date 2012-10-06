###
  JavaScript Library Boilerplate
  Copyright (c) 2012 Denis Ciccale (@tdecs)
  Released under MIT license (https:#raw.github.com/dciccale/jslibraryboilerplate/master/LICENSE.txt)
###


# helper methods
push = [].push
slice = [].slice
splice = [].splice
forEach = [].forEach

class JSLB
  # auto-create new instance without the 'new' keyword
  constructor: (selector) ->
    return new JSLB.prototype.init(selector)

  # handle the use of $(...)
  init: (selector) ->
    # no selector, return empty JSLB object
    return this if !selector

    # already a JSLB object
    return selector if selector instanceof JSLB

    # already a dom element?
    if selector.nodeType
      this[0] = selector
      this.length = 1
      return this

    # is css selector, query the dom
    if typeof selector == 'string'
      # find elements, turn NodeList to array and push them to JSLB
      return push.apply(this, slice.call(document.querySelectorAll(selector)))

    # it's a function, call it when DOM is ready
    if typeof selector == 'function'
      return JSLB(document).ready(selector)

  # default length of a JSLB object is 0
  length: 0

  # document ready method
  ready: (callback) ->
    # first check if already loaded
    if /complete|loaded|interactive/.test(document.readyState)
      callback(JSLB)

    # listen when it loads
    else
      document.addEventListener('DOMContentLoaded',
        -> callback(JSLB),
        false)

  # iterate JSLB object
  each: (callback) ->
    forEach.call(this, (el, i) -> callback.call(el, i, el))

  # sample method to change text of an element
  text: (value) ->
    # no element
    if !this[0]
      return this

    # get value
    if !value
      return this[0].textContent

    # set value to all elements on the collection
    else
      return this.each(-> this.textContent = value)

# abbreviate "prototype" to "fn"
JSLB.fn = JSLB.prototype
# the init method uses JSLB prototype and constructor
JSLB.prototype.init.prototype = JSLB.prototype
JSLB.prototype.init.prototype.constructor = JSLB
# just to have an array like instanceof JSLB object
JSLB.prototype.splice = splice

# expose to global object
window.JSLB = window.$ = JSLB