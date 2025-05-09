import 'package:flutter/material.dart';
import 'package:hadits/core/themes/app_strings.dart';
import 'package:hadits/presentation/main_hadiths_list.dart';


class HaditsPage extends StatelessWidget {
  const HaditsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.appName),
        ),
        body: MainHadithsList(),
      ),
    );
  }
}
