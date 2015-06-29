define('ace_vimtura', [], function(){
  requirejs.config({
    baseUrl: '/assets/ace_vimtura',
    paths: {
      ace_vimtura: 'ace_vimtura',
    },
    packages: [
      {
        name: 'ace',
        main: 'ace',
        location: "lib/ace"
      }, {
        name: 'ace/keyboard/vim',
        main: 'vim',
        location: 'lib/ace'
      }
    ]
  });

  require(['/assets/ace_vimtura/ace_vimtura.js'], function(av) {
    if (window) {
      return window.AceVimtura = av;
    } else {
      throw 'There is no window defined'
    }
  });
});
