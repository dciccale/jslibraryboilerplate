# JavaScript Library Boilerplate
# Copyright (c) 2013 Denis Ciccale (@tdecs)
# Released under MIT license (https://raw.github.com/dciccale/jslibraryboilerplate/master/LICENSE.txt)

((window) ->

  # helper methods
  document = window.document
  push = [].push
  slice = [].slice
  splice = [].splice
  forEach = [].forEach

  # handle the use of $(...)
  JSLB = (selector) ->

    # auto-create new instance without the 'new' keyword
    return new JSLB::init(selector)  unless this instanceof JSLB

    # no selector, return empty JSLB object
    return this  unless selector

    # already a JSLB object
    return selector  if selector instanceof JSLB

    # already a dom element?
    if selector.nodeType
      this[0] = selector
      @length = 1
      return this

    # is css selector, query the dom

    # find elements, turn NodeList to array and push them to JSLB
    return push.apply(this, slice.call(document.querySelectorAll(selector))) if typeof selector is "string"

    # it's a function, call it when DOM is ready
    JSLB(document).ready selector if typeof selector is "function"

  JSLB:: =

    # default length of a JSLB object is 0
    length: 0

    # document ready method
    ready: (callback) ->

      # first check if already loaded
      if /t/.test(document.readyState)
        callback JSLB

      # listen when it loads
      else
        document.addEventListener "DOMContentLoaded", (->
          callback JSLB
        ), false


    # iterate JSLB object
    each: (callback) ->
      forEach.call this, (el, i) ->
        callback.call el, i, el

    # sample method to get/set the text of an element
    text: (value) ->

      # no element
      return this  unless this[0]

      # get value
      unless value
        this[0].textContent

      # set value to all elements on the collection
      else
        @each ->
          @textContent = value



  # abbreviate "prototype" to "fn"
  JSLB.fn = JSLB::

  # just to have an array like instanceof JSLB object
  JSLB::splice = splice

  # expose to global object
  window.JSLB = window.$ = JSLB
) window
