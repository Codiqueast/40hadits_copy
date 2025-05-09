import 'package:flutter/material.dart';
import 'package:hadits/core/themes/app_strings.dart';
import 'package:hadits/presentation/pages/settings_page.dart';
import 'package:hadits/state/main_botton_bar_state.dart';
import 'package:provider/provider.dart' show Provider;
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'favorites__page.dart';
import 'hadits_page.dart';

class MainRoot extends StatefulWidget {
  const MainRoot({super.key});

  @override
  State<MainRoot> createState() => _MainRootState();
}

class _MainRootState extends State<MainRoot> {
  final List _mainPages = [
    const HaditsPage(),
    const FavoritesPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final mainbottonBarState = Provider.of<MainBottonBarState>(context);

    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
      child :_mainPages[mainbottonBarState.getIndex],
      ),
      bottomNavigationBar: SalomonBottomBar(
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.format_list_bulleted_rounded),
            title: Text(AppStrings.hadits),
            selectedColor: Colors.blue,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.bookmark_border),
            title: Text(AppStrings.favorites),
            selectedColor: Colors.blue,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.settings),
            title: Text(AppStrings.settings),
            selectedColor: Colors.blue,
          ),
        ],
        currentIndex: mainbottonBarState.getIndex,
        onTap: (int index) {
          mainbottonBarState.setIndex = index;
        },
      ),
    );
  }
}
