class Consummers
  @init:->
    @bind()

  @bind: ->
    $('#consumer_new_page form').on 'ajax:success', @setConsumer

  @setConsumer: ->
    $(t)
    #add after ajax remove form from list candidates

$(document).on 'turbolinks:load', ->
  Consummers.init()