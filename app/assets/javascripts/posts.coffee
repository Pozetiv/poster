class Posts
  @init: ->
    @bind()

  @bind: ->
    $('.post_container_body[data-href]').on 'click', @redirectToPost
    $('#post_show_page').on 'click', '.target-comments', @targetComments

  @redirectToPost: ->
    url = $(this).data('href')
    window.location.href = url
  
  @targetComments: ->
    $('.comments_block').toggleClass('d-none')

$(document).on 'turbolinks:load', ->
  Posts.init()
