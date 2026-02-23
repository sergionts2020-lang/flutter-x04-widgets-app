import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:x04_widgets_app/config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {

  static const name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter + material3')),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];
        return _CustomListTitle(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTitle extends StatelessWidget {
  const _CustomListTitle({required this.menuItem});

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_outlined, color: colors.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subtitle),
      onTap: () {   
        
        // Forma 1 (son necesarias las rutas en el main.dart).
        // Navigator.pushNamed(context, menuItem.link);
        
        // Forma 2
        // Navigator.of(context).push(
        //  MaterialPageRoute<void>(builder: (context) => const ButtonScreen()),
        // );
        //},
        
        // Forma 3 (con GoRouter)
        // context.go(menuItem.link); // Reemplaza la ruta actual por la nueva, sin posibilidad de volver atrás.
        // context.push(menuItem.link);

        // Forma 4 (con GoRouter y usando el name de las rutas)
        context.pushNamed(menuItem.name);
      },
    );
  }
}
