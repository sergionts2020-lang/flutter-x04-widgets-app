import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:x04_widgets_app/presentation/provider/counter_provider.dart';
import 'package:x04_widgets_app/presentation/provider/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const name = 'Counter Screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int result = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            icon: Icon(
              isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
            ),
            // Icons.dark_mode_outlined),
            onPressed: () {
              changeThemeMode(ref);
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Valor: ${result}',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.plus_one),
        onPressed: () {
          // Ambas formas son válidas
          ref.read(counterProvider.notifier).state++;
          ref.read(counterProvider.notifier).update((state) => state + 1);
        },
      ),
    );
  }

  void changeThemeMode(WidgetRef ref) {
    ref.read(isDarkModeProvider.notifier).update((state) => !state);
  }
}
