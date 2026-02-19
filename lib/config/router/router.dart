// GoRouter configuration
import 'package:go_router/go_router.dart';
import 'package:x04_widgets_app/presentation/screen/screens.dart';

// ssc documentación https://pub.dev/packages/go_router
final appRouter = GoRouter(
  routes: [
    GoRoute(path: '/', name: HomeScreen.name, builder: (context, state) => HomeScreen()),
    GoRoute(path: '/buttons', name: ButtonScreen.name, builder: (context, state) => const ButtonScreen()),
    GoRoute(path: '/cards', name: CardScreen.name, builder: (context, state) => const CardScreen()),
    GoRoute(path: '/progress', name: ProgressScreen.name, builder: (context, state) => const ProgressScreen()),
    GoRoute(path: '/snackbar', name: SnackbarScreen.name, builder: (context, state) => const SnackbarScreen()),
    GoRoute(path: '/animated', name: AnimatedContainerScreen.name, builder: (context, state) => const AnimatedContainerScreen()),
    GoRoute(path: '/uicontrols', name: UiControlsScreen.name, builder: (context, state) => const UiControlsScreen()),
    GoRoute(path: '/tutorial', name: AppTutorialScreen.name, builder: (context, state) => const AppTutorialScreen()),

  ],
);
