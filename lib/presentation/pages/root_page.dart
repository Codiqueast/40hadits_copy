import 'package:flutter/material.dart';
import 'package:hadits/core/themes/app_themes.dart';
import 'package:hadits/data/state/hadith_data_state.dart';
import 'package:hadits/presentation/pages/main_root.dart';
import 'package:hadits/routes/app_routes.dart';
import 'package:hadits/state/main_botton_bar_state.dart';
import 'package:provider/provider.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainBottonBarState(),
      ),
      ChangeNotifierProvider(
      create: (_) => HadithDataState()
      )
      ],

      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainRoot(),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      onGenerateRoute: AppRoutes.onGeneratorRout,
    ),
    );
  }
}
