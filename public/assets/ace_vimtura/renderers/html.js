var bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

define(function() {
  var Html;
  return Html = (function() {
    function Html(options) {
      this.render = bind(this.render, this);
    }

    Html.prototype.render = function(text) {
      return text;
    };

    return Html;

  })();
});
