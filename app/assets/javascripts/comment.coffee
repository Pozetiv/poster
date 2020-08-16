class Comment
  @init: ->
    @bind()

  @bind: ->
    $('.remove-button').on 'ajax:success', @removeComment
    $('.comment_block').on 'click', '#reply_buttoms', @showReply

  @removecomment: ->
    $(this).parents('.comment_block').hide ->
      $(this).remove()

  @showReply: ->
    $(this).next().toggle()

$(document).on 'turbolinks:load', ->
  Comment.init()
