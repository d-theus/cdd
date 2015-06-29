define 'posts', [], ->
  ready = ->
    if ta = document.getElementById('post_content')
      require ['form'], ->

    if document.getElementsByClassName('render').length > 0
      require ['renderer'], ->

  $(document).on 'page:load', ready
  $(document).ready ready
