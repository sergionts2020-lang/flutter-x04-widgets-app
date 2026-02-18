// GoRouter configuration
import 'package:go_router/go_router.dart';
import 'package:x04_widgets_app/presentation/screen/screens.dart';

// ssc documentación https://pub.dev/packages/go_router
final appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomeScreen()),
    GoRoute(path: '/button', builder: (context, state) => const ButtonScreen()),
    GoRoute(path: '/card', builder: (context, state) => const CardScreen())
  ],
);
