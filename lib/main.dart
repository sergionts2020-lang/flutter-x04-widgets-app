import 'package:flutter/material.dart';
import 'package:x04_widgets_app/config/router/router.dart';
import 'package:x04_widgets_app/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectedColor: 3).getTheme(),

      // Como estamos usando GoRouter, no es necesario definir el home ni las rutas, ya que se definen en el router.dart
      // home: const HomeScreen(),
      
      // Inicialmente podríamos haber inicializado las rutas para usarlo como la forma 1 del homescreen
      // routes: {
      //   '/buttons': (context) => const ButtonScreen(),
      //   '/cards': (context) => const CardScreen(),
      // },
    );
  }
}
