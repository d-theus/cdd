var bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

define(function() {
  var Preview;
  Preview = (function() {
    function Preview(ace_vimtura) {
      this.ace_vimtura = ace_vimtura;
      this.disable = bind(this.disable, this);
      this.enable = bind(this.enable, this);
      this.html = bind(this.html, this);
      this.instantUpdate = bind(this.instantUpdate, this);
      this.update = bind(this.update, this);
      this.dom = document.createElement('div');
      this.dom.classList.add('av_preview');
      this.timeout = null;
      this.isEnabled = false;
      this.ace_vimtura.dom.appendChild(this.dom);
      this.options = this.ace_vimtura.options;
      this.enable();
    }

    Preview.prototype.update = function(value) {
      if (this.timeout) {
        window.clearTimeout(this.timeout);
      }
      return this.timeout = window.setTimeout((function(_this) {
        return function() {
          _this.instantUpdate(value);
          return _this.timeout = null;
        };
      })(this), this.options.refreshTimeout);
    };

    Preview.prototype.instantUpdate = function(value) {
      return this.html(value);
    };

    Preview.prototype.html = function(text) {
      if (text) {
        return this.dom.innerHTML = text;
      } else {
        return this.dom.innerHTML;
      }
    };

    Preview.prototype.enable = function() {
      this.isEnabled = true;
      this.instantUpdate();
      return this.dom.classList.remove('collapsed');
    };

    Preview.prototype.disable = function() {
      this.isEnabled = false;
      return this.dom.classList.add('collapsed');
    };

    return Preview;

  })();
  return Preview;
});
