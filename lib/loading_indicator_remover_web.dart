import 'dart:js_interop';

@JS('eval')
external void _eval(String code);

void removeLoadingIndicator() {
  _eval('''
    (function() {
      var loader = document.getElementById('loading-indicator');
      if (loader) {
        loader.classList.add('fade-out');
        setTimeout(function() {
          loader.remove();
        }, 500);
      }
    })();
  ''');
}
