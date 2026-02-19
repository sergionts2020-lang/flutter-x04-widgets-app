import 'package:flutter/material.dart';
import 'package:x04_widgets_app/presentation/screen/button/button_screen.dart';
import 'package:x04_widgets_app/presentation/screen/card/card_screen.dart';
import 'package:x04_widgets_app/presentation/screen/progress/progress_screen.dart';
import 'package:x04_widgets_app/presentation/screen/screens.dart';

class MenuItem {
  final String name;
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.name,
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    name: ButtonScreen.name,
    title: 'Buttons',
    subtitle: 'Some buttons',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  
  MenuItem(
    name: CardScreen.name,
    title: 'Cards',
    subtitle: 'Some cards',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  
  MenuItem(
    name: ProgressScreen.name,
    title: 'Progress Indicators',
    subtitle: 'Some progress indicators',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),

  MenuItem(
    name: SnackbarScreen.name,
    title: 'Snackbars',
    subtitle: 'Some snackbars',
    link: '/snackbar',
    icon: Icons.sd_card_alert,
  ),

  MenuItem(
    name: AnimatedContainerScreen.name,
    title: 'Animated container',
    subtitle: 'Magic with containers',
    link: '/animated',
    icon: Icons.star_half,
  ),

  MenuItem(
    name: UiControlsScreen.name,
    title: 'UI Controls',
    subtitle: 'Some UI controls',
    link: '/uicontrols',
    icon: Icons.control_point_duplicate_rounded,
  ),

  MenuItem(
    name: AppTutorialScreen.name,
    title: 'App Tutorial',
    subtitle: 'Tutorial of the app',
    link: '/tutorial',
    icon: Icons.question_mark_rounded,
  ),
];
