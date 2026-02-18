// GoRouter configuration
import 'package:go_router/go_router.dart';
import 'package:x04_widgets_app/presentation/screen/screens.dart';

// ssc documentación https://pub.dev/packages/go_router
final appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', name: HomeScreen.name, builder: (context, state) => HomeScreen()),
    GoRoute(path: '/buttons', name: ButtonScreen.name, builder: (context, state) => const ButtonScreen()),
    GoRoute(path: '/cards', name: CardScreen.name, builder: (context, state) => const CardScreen())
  ],
);
