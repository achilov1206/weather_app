import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/temp_settings/temp_settings_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: ListTile(
          title: Text('Temperature Unit'),
          subtitle: Text('Celcius/Fahrenheit (Default: Celsius'),
          trailing: Switch(
            onChanged: (_) {
              context.read<TempSettingsCubit>().toggleTempUnit();
            },
            value: context.watch<TempSettingsCubit>().state.tempUnit ==
                TempUnit.celsius,
          ),
        ),
      ),
    );
  }
}
