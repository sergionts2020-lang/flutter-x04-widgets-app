import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:x04_widgets_app/config/theme/app_theme.dart';
// ----------------------------------------------------------------

// Provider                 ==>   Valores inmutables
// ----------------------------------------------------------------
final colorListProvider = Provider((ref) => colorList);

// StateProvider            ==>   Mantener alguna pieza de estado
// ----------------------------------------------------------------
final isDarkModeProvider = StateProvider<bool>((ref) => false);
final selectedColorProvider = StateProvider<int>((ref) => 0);

// StateNotifierProvider    ==>   Estados complejos
// ----------------------------------------------------------------
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

// controller para manejar el estado de apptheme
class ThemeNotifier extends StateNotifier<AppTheme> {
  // state = estado = new apptheme()
  ThemeNotifier() : super(AppTheme());

  void changeDarkMode() {
    // como son final las propiedades, lo que hacemos es cambiar el estado por una copia con el nuevo valor
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
