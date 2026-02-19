import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbar y diálogos')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('showAboutDialog'),
                    const Text(
                      'Flutter es un framework de código abierto para crear aplicaciones móviles, web y de escritorio.',
                    ),
                  ],
                );
              },
              child: const Text('showAboutDialog'),
            ),

            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: const Text('showDialog'),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSanckbar(context),
      ),
    );
  }

  void showCustomSanckbar(BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).clearSnackBars(); // borra los snackbars anteriores para evitar que se acumulen
    final snackBar = SnackBar(
      content: const Text('Hola snackbar'),
      action: SnackBarAction(label: 'Cerrar', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // para que no se cierre al hacer click fuera del dialogo
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text(
          'Consectetur cillum veniam non fugiat non ea. Aliquip culpa quis elit ullamco sunt consectetur est ea sit ut. Nulla id sint ut ex laboris exercitation deserunt nisi. Elit id id occaecat consectetur velit officia reprehenderit eu irure consectetur laborum esse magna duis. Ullamco sint laborum aute officia eiusmod irure tempor ullamco id minim excepteur. Nulla sunt aute voluptate exercitation ut adipisicing qui tempor magna voluptate. Occaecat incididunt amet mollit aliquip laboris nisi non duis ea amet labore veniam.',
        ),
        actions: [
          TextButton(onPressed: () => context.pop(), child: const Text('Cancelar')),
          FilledButton(onPressed: () => context.pop(), child: const Text('Aceptar'))
        ],
      ),
    );
  }
}
