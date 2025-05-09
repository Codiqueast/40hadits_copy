import 'package:flutter/material.dart';
import 'package:hadits/core/themes/app_strings.dart';
import 'package:hadits/presentation/favorite_hadiths_list.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.favorites),
      ),
      body: favoriteHadithsList(),
    );
  }
}
