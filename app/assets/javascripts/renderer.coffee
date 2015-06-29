define "renderer", ['marked'], (marked)->

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
    Array::forEach.call renders, (render)->
      text = render.dataset.source
      $(render).html(marked text)
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
