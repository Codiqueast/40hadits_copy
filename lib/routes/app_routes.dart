
import 'package:flutter/material.dart';
import 'package:hadits/data/models/hadith_args.dart';
import 'package:hadits/presentation/pages/hadith_detail.dart';
import 'package:hadits/routes/route_names.dart';


class AppRoutes{
 static Route onGeneratorRout(RouteSettings routeSettings){
 switch (routeSettings.name) {
   case RouteNames.hadithDetailPage:
     final HadithArgs hadithArgs = routeSettings.arguments as HadithArgs;
     return MaterialPageRoute(builder: (_) =>  HadithDetail(hadithId: hadithArgs.hadithId,));

 default: throw Exception('invalid route\n${routeSettings.name}');
 }
}
  
}