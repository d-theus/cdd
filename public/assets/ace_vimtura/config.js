requirejs.config({
  paths: {
    ace_vimtura: 'ace_vimtura'
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
