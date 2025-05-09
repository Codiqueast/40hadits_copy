import 'package:flutter/material.dart';
import 'package:hadits/core/themes/app_strings.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.settings),
      ),
      body:Container()
    );
  }
}
