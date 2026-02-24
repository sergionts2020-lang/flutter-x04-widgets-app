import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x04_widgets_app/config/router/router.dart';
import 'package:x04_widgets_app/config/theme/app_theme.dart';
import 'package:x04_widgets_app/presentation/provider/theme_provider.dart';

void main() {
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final bool isDarkMode = ref.watch(isDarkModeProvider);
    // final int selectedColor = ref.watch(selectedColorProvider);
    final AppTheme appTheme = ref.watch(themeNotifierProvider);

    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'Widgets App',
      debugShowCheckedModeBanner: false,
      theme: appTheme.getTheme(),

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
