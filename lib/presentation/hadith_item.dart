// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:hadits/data/models/hadith_args.dart';
import 'package:hadits/data/state/hadith_data_state.dart';
import 'package:hadits/domain/entities/hadith_entity.dart';
import 'package:hadits/routes/route_names.dart';
import 'package:provider/provider.dart';

class HadithItem extends StatelessWidget {
  const HadithItem({super.key,
    required this.hadithModel,
    required this.index});

  final HadithEntity hadithModel;
  final int index;
  @override


  Widget build(BuildContext context) {
    final appColor = Theme.of(context).colorScheme;
    final Color oddcolor = appColor.primary.withOpacity(0.05);
    final Color evencolor = appColor.primary.withOpacity(0.15);
    return ListTile(
      tileColor: index.isOdd ? oddcolor : evencolor,
      onTap: () {
        Navigator.pushNamed(context, RouteNames.hadithDetailPage,
         arguments: HadithArgs(hadithId: hadithModel.id ),
        );
      },

      title: Text(hadithModel.hadithNumber,
      style: TextStyle(
        color: appColor.primary,
        fontSize: 20,
        fontWeight: FontWeight.bold

      ),
      ),
      leading: IconButton(
          onPressed: (){
            Provider.of<HadithDataState>(context, listen: false).fetchAddRemoveFavorite(
              hadithId: hadithModel.id,
              favoriteState: hadithModel.favoriteState == 0 ? 1 : 0,
            );
          },
          icon: hadithModel.favoriteState == 0 ? Icon(Icons.bookmark_border) : const Icon(Icons.bookmark),
      ),
      subtitle: Text(hadithModel.hadithTitle),

    );
  }
}
