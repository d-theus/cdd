# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
langDictionary =
  'javascript': 'JS'
  'coffeescript': 'COFFEE'

getLanguage = (codeTag)->
  lang = null
  rxp = /lang-(\S+)/
  Array::forEach.call codeTag.classList, (cla)->
    return unless ms = rxp.exec(cla)
    match = ms[1]
    lang = match if match
  langDictionary[lang] || lang

ready = ->

  if ta = document.getElementById('post_content')
    require ['ace_vimtura'], (av)->
      AceVimtura.init(
        'editor'
        {
          filetype: 'markdown'
          theme: 'solarized_light'
        })
      AceVimtura.ace.setValue(ta.value)
      AceVimtura.ace.on 'change', ()->
        ta.value = AceVimtura.ace.getValue()

  renders = document.getElementsByClassName('render')
  if (renders.length > 0)
    window.AceVimtura =
      Renderers:
        Vendor: {}
    requirejs.config({
      baseUrl: '/assets/ace_vimtura'
    })
    require ['/assets/ace_vimtura/renderers/markdown.js'], ()->
      window.Markdown = new window.AceVimtura.Renderers.Markdown
      Array::forEach.call renders, (render)->
        text = render.dataset.source
        $(render).html(Markdown.render text)
        pre = $(".render pre")
        pre.each (i,e)->
          code = $(this).find('code').get(0)
          hljs.highlightBlock(code)
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
