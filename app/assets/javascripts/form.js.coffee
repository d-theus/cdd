define 'form', [], ()->
  require ['/assets/ace_vimtura/main.js'], ()->
    require ['ace_vimtura'], ->
      AceVimtura.init(
        'editor'
        {
          filetype: 'markdown'
          theme: 'solarized_light'
      })
      AceVimtura.ace.setValue(ta.value)
      AceVimtura.ace.on 'change', ()->
        ta.value = AceVimtura.ace.getValue()
