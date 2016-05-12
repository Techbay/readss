callNativeApp = ->
  try
    console.log("hello")
    webkit.messageHandlers.callbackHandler.postMessage("Hello from JavaScript")
  catch err
    console.log(err)
    console.log('The native context does not exist yet')


setTimeout(
  -> callNativeApp()
  5000
)

redHeader = ->
  alert("hellow")

$(document).ready ->
  $(".video").on "click", ->
    alert($(this).data("video-id"))
    false
