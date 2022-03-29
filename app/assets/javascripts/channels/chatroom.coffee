App.chatroom = App.cable.subscriptions.create "ChatroomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # alert data.foo
    $('#message-container').append data.mod_message # mod_message from messages_controller:9
    scroll_bottom();
    return
  
  jQuery(document).on 'turbolinks:load', ->
    scroll_bottom();
    return
