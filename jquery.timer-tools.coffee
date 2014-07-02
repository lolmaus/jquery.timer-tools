###!
jquery.timer-tools v0.1.0
by Andrey Mikhaylov (lolmaus) lolmaus@gmail.com
inspired by https://code.google.com/p/jquery-debounce/
MIT license
###

$.extend

  delay: (msTimeout, callback) ->
    setTimeout callback, msTimeout


  debounceLast: (msTimeout, context, callback) ->
    if arguments.length < 2
      throw "debounceLast called with less than two arguments"
      
    else if arguments.length is 2
      [context, callback] = [undefined, context]

    timer = null
    
    (args...) ->
      context = context or this
      
      clearTimeout timer
      
      timer = $.delay msTimeout, ->
        callback.apply context, args
        timer = null


  debounceFirst: (msTimeout, context, callback) ->
    if arguments.length < 2
      throw "debounceFirst called with less than two arguments"
      
    else if arguments.length is 2
      [context, callback] = [undefined, context]

    timer = null
    
    (args...) ->
      context = context or this
      
      unless timer
        callback.apply context, args
      
      clearTimeout timer
      
      timer = $.delay msTimeout, ->
        timer = null


  throttle: (msTimeout, context, callback) ->
    if arguments.length < 2
      throw "throttle called with less than two arguments"
      
    else if arguments.length is 2
      [context, callback] = [undefined, context]
      
    timer = null
    
    (args...) ->
      context = context or this
      
      unless timer
        callback.apply context, args
        timer = $.delay msTimeout, ->
          timer = null
