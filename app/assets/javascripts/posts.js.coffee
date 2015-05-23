# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#= require 'm_d_e'

marked.setOptions(
  highlight: (code)->
    hljs.highlightAuto(code).value
)

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
    editor.setTheme('solarized_light')
    editor.setViMode()

  if renders = document.getElementsByClassName('md-render')
    Array::forEach.call renders, (render)->
      text = render.dataset.source
      $(render).html(window.marked(text))
      pre = $(".md-render pre")
      pre.each (i,e)->
        code = $(this).find('code').get(0)
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
                .html(getLanguage(code))
              )
        )

$(document).on 'page:load', ready
$(document).ready ready
