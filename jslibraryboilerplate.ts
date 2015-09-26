/*!
 * JavaScript Library Boilerplate
 * Copyright (c) 2013 Denis Ciccale (@tdecs)
 * Released under MIT license (https://raw.github.com/dciccale/jslibraryboilerplate/master/LICENSE.txt)
 */
class JSLB {
  // handle the use of $(...)
  constructor (selector) {
    // auto-create new instance without the 'new' keyword
    if (!(this instanceof JSLB)) {
      return new JSLB(selector)
    }

    // no selector, return empty JSLB object
    if (!selector) {
      return this;
    }

    // already a JSLB object
    if (selector instanceof JSLB) {
      return selector;
    }

    // already a dom element?
    if (selector.nodeType) {
      this[0] = selector;
      this.length = 1;
      return this;
    }

    // is css selector, query the dom
    if (typeof selector === 'string') {
      // find elements, turn NodeList to array and push them to JSLB
      return [].push.apply(this, [].slice.call(document.querySelectorAll(selector)));
    }

    // it's a function, call it when DOM is ready
    if (typeof selector === 'function') {
      return new JSLB(document).ready(selector);
    }
  }
  splice;
  // default length of a JSLB object is 0
  length: number = 0;

  // document ready method
  ready (callback) {
    // first check if already loaded
    if (/complete|loaded|interactive/.test(document.readyState)) {
      callback(JSLB);

    // listen when it loads
    } else {
      document.addEventListener('DOMContentLoaded', function () {
        callback(JSLB);
      }, false);
    }
  }
  // iterate JSLB object
  each (callback) {
    [].forEach.call(this, function (el, i) {
      callback.call(el, i, el);
    });
  }
  // sample method to change text of an element
  text (value) {
    // no element
    if (!this[0]) {
      return this;
    }
    // get value
    if (!value) {
      return this[0].textContent;

    // set value to all elements on the collection
    } else {
      return this.each(function () {
        this.textContent = value;
      });
    }
  }
}

// abbreviate "prototype" to "fn"
JSLB['fn'] = JSLB.prototype;
// just to have an array like instanceof JSLB object
JSLB.prototype.splice = [].splice;

// expose to global object
window['$'] = JSLB;
