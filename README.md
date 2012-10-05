# JavaScript Library Boilerplate

An easy boilerplate for rolling your own JavaScript Library like jQuery, Zepto, Prototype, etc.

The actual code is written in [TypeScript](http://www.typescriptlang.org).

## Compile
To compile the jslibraryboilerplate.ts file you will need [Node.js](http://nodejs.org)

If you already installed it, run this commmand-line to download TypeScript package:

```
npm install -g typescript
```

Now you can compile:

```
tsc jslibraryboilerplate.ts
```

## Usage
Include jslibraryboilerplate.js file on an html file and you are done!

### Code example
```javascript
// $(selector); you can use any valid CSS selector
// for getting elements from the document
$('p'); // get all p elements of the document
$('.test'); // all elements with class 'test'
// iterate through 'li' elements to know if they
// are even or odd
$('li').each(function (el, i) {
  if (i % 2 === 0) {
    alert('is even');
  } else {
    alert('is odd');
  }
});
```

## Add new methods
You can add the methods you need to work on the DOM

### Code example
```javascript
$.fn.highlight = function (color) {
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