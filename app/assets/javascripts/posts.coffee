class Posts
  @init: ->
    @bind()

  @bind: ->
    $('.post_container_body[data-href]').on 'click', @redirectToPost

  @redirectToPost: ->
    url = $(this).data('href')
    window.location.href = url

$(document).on 'turbolinks:load', ->
  Posts.init()
