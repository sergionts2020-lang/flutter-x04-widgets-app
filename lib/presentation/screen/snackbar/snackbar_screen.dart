import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbar y diálogos')),
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
}
