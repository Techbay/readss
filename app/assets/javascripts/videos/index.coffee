getUser = ->
  $.get '/user_id', (data)-> console.log(data); setUser(data)

setUser = (userId)->
  try
    webkit.messageHandlers.callbackHandler.postMessage(userId)
  catch err
    console.log('The native context does not exist yet')

$(document).ready ->
  getUser()
