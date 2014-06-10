jquery.timer-tools
==================

Handy decorators for debouncing and throttling callbacks



Dependencies
------------

jQuery.


Usage
-----

### $.delay ( msTimeout, callback )

This is an alias to `setTimeout` with different order of arguments.


```js
// Instead of this...
setTimeout( function() {
  console.log('foo');
}, 1000);

// ...you can do
$.delay( 1000, function() {
  console.log('foo');
});
```

With CoffeeScript:

```coffee
# Instead of this...
setTimeout ->
  console.log 'foo'
, 1000

#  ...you can do
$.delay 1000, ->
  console.log 'foo'
```


### $.debounceFirst ( msTimeout, [context], callback )

Decorates the callback. Retuns a function that, when executed, executes the callback in the given context once, then ignores further executions until there's a given period of time free of execution attempts.

Consider this:

```js
$('html').mousemove(
  $.debounceFirst( 3000, function() {
    console.log('foo');
  })
);
```

same with CoffeeScript:

```coffee
$ 'html
  .mousemove $.debounceFirst 3000, ->
    console.log 'foo'
```

When you move the mouse, the log message appears. If you keep moving the mouse, further messages will not appear. If you keep the mouse steady for three seconds, then you can move it for the message to appear again.


### $.debounceLast ( msTimeout, [context], callback )

Decorates the callback. Retuns a function that, when executed, ignores further executions and waits for a given period of time free of execution attempts, then executes the callback.

Consider this:

```js
$('html').mousemove(
  $.debounceLast( 3000, function() {
    console.log('foo');
  })
);
```

same with CoffeeScript:

```coffee
$ 'html
  .mousemove $.debounceLast 3000, ->
    console.log 'foo'
```

When you move the mouse, nothing happens. Three seconds after you stop moving the mouse, the log message appears.


### $.throttle ( msTimeout, [context], callback )

Decorates the callback. Retuns a function that, when executed, executes the callback. When executed again, the function executes the callback only if the given amount of time has passed since the previous callback execution.

Consider this:

```js
$('html').mousemove(
  $.throttle( 3000, function() {
    console.log('foo');
  })
);
```

same with CoffeeScript:

```coffee
$ 'html
  .mousemove $.throttle 3000, ->
    console.log 'foo'
```


While you keep moving the mouse, the callback gets executed every three seconds.


Development
-----------

Use [cult](https://github.com/typicode/cult) to run the gulp task for compiling and minifying.



Credit
------

Coded by Andrey Mikhaylov (lolmaus).

Inspired by [jquery-debounce](https://code.google.com/p/jquery-debounce/) by dfilatov.