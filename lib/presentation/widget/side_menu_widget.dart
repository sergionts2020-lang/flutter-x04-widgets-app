import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x04_widgets_app/config/menu/menu_items.dart';

class SideMenuWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenuWidget({super.key, required this.scaffoldKey});

  @override
  State<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch =
        MediaQuery.of(context).viewPadding.top >
        35; // aprox. el tamaño del notch

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (index) {
        navDrawerIndex = index;
        setState(() {});

        final menuItem = appMenuItems[index];
        context.push(menuItem.link);

        // Cuidado aquí porque quiero hacer referencia dentro de un state a las variables de fuera
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
          padding: EdgeInsetsGeometry.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
          child: Text('Main'),
        ),

        ...appMenuItems.map(
          (item) => NavigationDrawerDestination(
            icon: Icon(item.icon),
            label: Text(item.name),
          ),
        ),

        // Sería otra posible pestaña
        // NavigationDrawerDestination(
        //   icon: const Icon(Icons.shopping_cart),
        //   label: const Text('Other Screen'),
        // ),
      ],
    );
  }
}
