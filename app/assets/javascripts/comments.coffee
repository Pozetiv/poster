class Comments
  @init: ->
    @bind()

  @bind: ->
    $('a.remove-button').on 'ajax:success', @removeComment
    $('.comment_block').on 'click', '#reply_buttoms', @showReply

  @removeComment: ->
    $(this).parents('.comment_block').slideUp ->
      $(this).remove()

  @showReply: ->
    $(this).next().toggle()

$(document).on 'turbolinks:load', ->
  Comments.init()
