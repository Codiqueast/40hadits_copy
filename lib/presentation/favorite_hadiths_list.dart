import "package:flutter/material.dart";
import 'package:hadits/data/state/hadith_data_state.dart';
import 'package:hadits/domain/entities/hadith_entity.dart';
import 'package:hadits/presentation/hadith_item.dart';
import 'package:provider/provider.dart';

class favoriteHadithsList extends StatelessWidget {
  const favoriteHadithsList({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HadithEntity>>(
      future: Provider.of<HadithDataState>(context).fetchFavoriteHadiths(),
      builder:(context, snapshot) {
        print("DEBUG >> hasData: ${snapshot.hasData}, hasError: ${snapshot.hasError}, error: ${snapshot.error}, data: ${snapshot.data}");
        if (snapshot.hasError) {
          return Center(child: Text('Ошибка: ${snapshot.error}'));
        }

        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return Scrollbar(
            child: ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final hadithModel = snapshot.data![index];
                return HadithItem(hadithModel: hadithModel, index: index);
              },
            ),
          );
        }

        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return  ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final HadithEntity hadithModel = snapshot.data![index];
              return HadithItem(
                  hadithModel: hadithModel,
                  index: index);
            },
          );
        } else {
          return const Center(
            child:Text(
                'Избронных хадисов нет', style: TextStyle(
              fontSize: 20
            ),
            )
          );
        }
      },
    );
  }
}


