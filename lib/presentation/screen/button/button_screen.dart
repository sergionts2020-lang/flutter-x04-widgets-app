import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonScreen extends StatelessWidget {
  static const name = 'buttons_screen';

  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Buttons Screen')),
      body: const _ButtosView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          context
              .pop(); // Vuelve a la pantalla anterior. Push superpone pantalla, pop la quita y vuelve a la anterior.
        },
      ),
    );
  }
}

class _ButtosView extends StatelessWidget {
  const _ButtosView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            _SectionDividerTitle(title: 'Elevated Buttons'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {}, child: Text('BE_Elevated')),
                ElevatedButton(onPressed: null, child: Text('BE_Disabled')),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.access_alarm_rounded),
                  label: Text('IE_Elevated'),
                ),
              ],
            ),

            // _SectionDivider(),
            _SectionDividerTitle(title: 'Filled Buttons'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(onPressed: () {}, child: const Text('BF_Filled')),
                FilledButton(onPressed: null, child: const Text('BF_Disabled')),
                FilledButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.route_rounded),
                  label: const Text('IF_Filled'),
                ),
              ],
            ),

            // _SectionDivider(),
            _SectionDividerTitle(title: 'Outlined Buttons'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('BO_Outlined'),
                ),
                OutlinedButton(
                  onPressed: null,
                  child: const Text('BO_Disabled'),
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.rocket_rounded),
                  label: const Text('IO_Outlined'),
                ),
              ],
            ),

            // _SectionDivider(),
            _SectionDividerTitle(title: 'Text Buttons'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: () {}, child: const Text('BT_Outlined')),
                TextButton(onPressed: null, child: const Text('BT_Disabled')),
                TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.room_rounded),
                  label: const Text('IT_Outlined'),
                ),
              ],
            ),

            // _SectionDivider(),
            _SectionDividerTitle(title: 'Icon Buttons'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.add_rounded)),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.rowing_rounded),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(colors.primary),
                    iconColor: WidgetStatePropertyAll(Colors.white),
                  ),
                ),
              ],
            ),

            // _SectionDivider(),
            _SectionDividerTitle(title: 'Custom Buttons'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [const CustomButton()],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect( // bordes redondeados, es necesario para que el efecto de pulsado no se salga de los bordes.
    borderRadius: BorderRadiusGeometry.circular(30),
      child: Material(
        color: colors.primary,
        child: InkWell( // efecto de pulsado, es necesario que el padre sea un Material para que se vea el efecto.
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('custom button', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}

class _SectionDividerTitle extends StatelessWidget {
  final String title;

  const _SectionDividerTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          const Expanded(child: Divider()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          const Expanded(child: Divider()),
        ],
      ),
    );
  }
}
