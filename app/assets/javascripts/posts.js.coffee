# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#= require 'm_d_e'
marked = require('marked')

ready = ->

  if ta = document.getElementById('post_content')
    editor = new Editor('post_content')

  modal = document.getElementById('search_modal')
  modal_toggle = document.querySelector('[name="search_toggle"]')
  modal_toggle.onclick = ->
    req = $.ajax
      url: '/posts/search_form'
      beforeSend: ->
        modal.loading()
      success: (data) ->
        modal.open(data)

  if previews = document.getElementsByClassName('md-render')
    Array::forEach.call previews, (pre)->
      text = pre.dataset.source
      $(pre).html(window.marked(text))

$(document).on 'page:load', ready
$(document).ready ready
