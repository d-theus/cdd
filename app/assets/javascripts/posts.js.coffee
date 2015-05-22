# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#= require 'm_d_e'
marked = require('marked')

langDictionary =
  'javascript': 'JS'
  'coffeescript': 'COFFEE'

getLanguage = (codeTag)->
  lang = null
  rxp = /lang-(\w+)/
  Array::forEach.call codeTag.classList, (cla)->
    match = rxp.exec(cla)[1]
    lang = match if match
  langDictionary[lang] || lang

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

  if renders = document.getElementsByClassName('md-render')
    Array::forEach.call renders, (render)->
      text = render.dataset.source
      $(render).html(window.marked(text))
      pre = $(".md-render pre")
      pre.each (i,e)->
        $(this).prepend(
          $("<div>")
            .addClass('langspec')
            .append(
              $("<span>")
                .addClass('flaticon')
                .addClass('flaticon-gear')
            )
              .append(
                $("<span>")
                  .addClass("langname")
                .html(getLanguage($(this).find('code').get(0)))
              )
      )

$(document).on 'page:load', ready
$(document).ready ready
