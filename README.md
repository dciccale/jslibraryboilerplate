# JavaScript Library Boilerplate

An easy boilerplate for rolling your own JavaScript Library like jQuery, Zepto, Prototype, etc.

The code is written in [CoffeeScript](http://www.coffeescript.org), [TypeScript](http://www.typescriptlang.org) and pure JavaScript.

## Compiling
For compiling CoffeeScript or TypeScript you will need to install [Node.js](http://nodejs.org)

After installing Node.js you can compile the files throgh command-line

### CoffeeScript
Install CoffeeScript package:

```
npm install -g typescript
```

Compile file:

```
coffee jslibraryboilerplate_coffee.coffee
```

### TypeScript
Install TypeScript package:

```
npm install -g typescript
```

Compile file:

```
tsc jslibraryboilerplate_class.ts
```

## Usage
Include the ´.js´ file in an html document and you are done!

## $(...)

Use any valid CSS selector for getting elements from the document

```javascript
// all p elements
$('p');
// all elements with class 'test'
$('.test');
// checkboxes
$('input[type="checkbox"]');
```

## Demo

### Copy, paste to an .html file and run [(Live demo)](http://dciccale.github.com/jslibraryboilerplate/demo.html)

```html
<!doctype html>
  <title>JavaScript Library Boilerplate</title>
  <!-- include .js file (you may change the name) -->
  <script src="jslibraryboilerplate.js"></script>
  <script>
    // wait for the dom be ready
    $(function () {
      // get all p elements
      var ps = $('p');
      console.log('There are ' + ps.length + ' paragraphs on the page');
      // set some text for the empty paragraphs
      $('.fillme').text('yeah!!');
      // iterate p elements to know if they are even or odd
      ps.each(function (i, el) {
        var evenodd = i % 2 === 0 ? ' even' : ' odd';
        this.textContent += ' (' + i +  evenodd + ')';
      });
    });
  </script>

  <p>This is a paragraph</p>
  <p>Another p</p>

  <p class="fillme"></p>
  <p class="fillme"></p>
  <p class="fillme"></p>
```

## Adding new methods
You can add any method you need to work with a JSLB DOM collection

### Example
```javascript
$.fn.highlight = function (color) {
  color = color || 'yellow'
  return this.each(function () {
    this.style.setProperty('color', color);
  });
};

// highlight all 'strong' elements
$('strong').highlight('red');
```

That's all, go and roll your own JavaScript Library.

## License
See [LICENSE.txt](https://raw.github.com/dciccale/jslibraryboilerplate/master/LICENSE.txt)