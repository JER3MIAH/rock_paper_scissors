import 'src/app.dart';
import 'package:flutter/material.dart';
import 'loading_indicator_remover.dart' 
  if (dart.library.js_interop) 'loading_indicator_remover_web.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Future.delayed(
    const Duration(milliseconds: 500),
    () {
      runApp(MyApp());
      
      // Remove loading indicator after first frame is rendered
      WidgetsBinding.instance.addPostFrameCallback((_) {
        removeLoadingIndicator();
      });
    },
  );
}
