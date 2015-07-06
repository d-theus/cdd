#= require marked
ready = ->
  render = (dom)->
    text = dom.dataset.source
    return unless text
    $(dom).html(marked text)
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

  $('#upload').on 'ajax:success', (e, data)->
    
    $('#post_content').val(data)
    prev = $('.render')[0]
    prev.dataset.source = data
    render(prev)

  if document.getElementsByClassName('render').length > 0
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

    renders = document.getElementsByClassName('render')
    if (renders.length > 0)
      Array::forEach.call renders, render

$(document).on 'page:load', ready
$(document).ready ready
