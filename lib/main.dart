import 'dart:io';
import 'dart:math';                                       // Add this import
import 'dart:ui';                                         // And this import

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';                   // Add this import
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:window_size/window_size.dart';

import '../assets.dart';
import '../orb_shader/orb_shader_config.dart';            // And this import
import '../orb_shader/orb_shader_widget.dart';            // And this import too
import '../styles.dart';
import 'title_screen/shaders.dart';
import 'title_screen/title_screen.dart';
import 'title_screen/title_screen_ui.dart';

void main() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    WidgetsFlutterBinding.ensureInitialized();
    setWindowMinSize(const Size(800, 500));
  }
  Animate.restartOnHotReload = true;
  runApp(                                                // Edit from here...
    FutureProvider<Shaders?>(
      create: (context) => loadShaders(),
      initialData: null,
      child: const NextGenApp(),
    ),
  );                                                     // to here.
}

class NextGenApp extends StatelessWidget {
  const NextGenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: const TitleScreen(),
    );
  }
}