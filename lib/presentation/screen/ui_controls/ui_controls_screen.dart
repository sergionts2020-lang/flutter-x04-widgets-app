import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UI Controls')),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(), // Evita el efecto rebote iOS
      children: [
        SwitchListTile(
          title: const Text('SwitchListTile'),
          subtitle: const Text('Additional controls'),
          value: isDeveloper,
          onChanged: (value) => setState(() {
            isDeveloper = !isDeveloper;
          }),
        ),

        createRadioListTile(Transportation.car),
        createRadioListTile(Transportation.plane),
        createRadioListTile(Transportation.boat),
        createRadioListTile(Transportation.submarine),

        createExpansionTile(),

        createCheckboxListTile(
          wantsBreakfast,
          'desayuno',
          (value) => setState(() => wantsBreakfast = value ?? false),
        ),
        createCheckboxListTile(
          wantsLunch,
          'almuerzo',
          (value) => setState(() => wantsLunch = value ?? false),
        ),
        createCheckboxListTile(
          wantsDinner,
          'cena',
          (value) => setState(() => wantsDinner = value ?? false),
        ),
      ],
    );
  }

  RadioListTile<Transportation> createRadioListTile(
    Transportation transportation,
  ) {
    return RadioListTile(
      title: Text(transportation.name.toUpperCase()),
      subtitle: Text(
        'Viajar por ${transportation.name[0].toUpperCase()}${transportation.name.substring(1)}',
      ),
      value: transportation,
      groupValue: selectedTransportation,
      onChanged: (value) => setState(() {
        selectedTransportation = transportation;
      }),
    );
  }

  ExpansionTile createExpansionTile() {
    return ExpansionTile(
      title: const Text('ExpansionTile'),
      subtitle: Text('$selectedTransportation'),
      children: [
        createRadioListTile(Transportation.car),
        createRadioListTile(Transportation.plane),
        createRadioListTile(Transportation.boat),
        createRadioListTile(Transportation.submarine),
      ],
    );
  }

  CheckboxListTile createCheckboxListTile(
    bool wantsValue,
    String label,
    Function(bool?) onChanged,
  ) {
    return CheckboxListTile(
      title: Text('CheckboxListTile $label'),
      subtitle: Text('¿quiere $label?'),
      value: wantsValue,
      onChanged: onChanged,
    );
  }
}
