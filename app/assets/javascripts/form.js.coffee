define 'form', [
  'ace_vimtura/ace_vimtura'
], (av)->
  av.init(
    'editor'
    {
      filetype: 'markdown'
      theme: 'solarized_light'
  })
  av.ready ->
    ta = $('#post_content')
    av.loadText(ta.val())
    av.ace.on 'change', ()->
      ta.val(av.ace.getValue())

  window.AceVimtura = av
