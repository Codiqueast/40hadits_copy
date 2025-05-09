
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:hadits/core/themes/app_strings.dart';
import 'package:hadits/core/themes/app_styles.dart';
import 'package:hadits/data/state/hadith_data_state.dart';
import 'package:hadits/domain/entities/hadith_entity.dart';
import 'package:provider/provider.dart' show Provider;

class HadithDetail extends StatelessWidget {
  const HadithDetail({super.key,
    required this.hadithId
  });
  final hadithId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<HadithEntity>(
        future: Provider.of<HadithDataState>(context).fetchHadithById(hadithId: hadithId),
        builder: (context, snapshot) {
          final HadithEntity hadithModel = snapshot.data!;
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                title: Text(hadithModel.hadithNumber, style: TextStyle(
                  fontSize: 25,
                ),),
                   actions: [
                   FutureBuilder<int>(
           future: Provider.of<HadithDataState>(context).fetchFavoriteState(hadithId: hadithModel.id),
                    builder: (context, snapshot) {
                       if(snapshot.hasData){
                         final favoriteState = snapshot.data!;
                         return IconButton(
                          
                             onPressed: (){
                               Provider.of<HadithDataState>(context, listen: false).fetchAddRemoveFavorite(
                                 hadithId: hadithModel.id,
                                 favoriteState: hadithModel.favoriteState == 0 ? 1 : 0,
                               );
                             },
                             icon: favoriteState == 0 ? Icon(Icons.bookmark_border) : const Icon(Icons.bookmark),
                      );
                       } else {
                         return const SizedBox();
                      };
                    }
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Scrollbar(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Card(
                        margin: AppStyles.mainMarginMini,
                        child: Padding(
                          padding:AppStyles.mainMargin,
                          child: Text(hadithModel.hadithTitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18
                            ),
                          ),
                        ),
                      ),
                     Html(data: hadithModel.hadithArabic),
                     Html(data: hadithModel.hadithTranslation),

                    ],
                  ),
                ),
              ),
            );

          } else {
            return Scaffold(
                appBar: AppBar(
                  title: Text(AppStrings.error),
                ),
                body:Center(
                  child: Text(AppStrings.errorGetData, style:
                  TextStyle(
                      color: Colors.red,
                    fontWeight:FontWeight.bold,
                    fontSize:30,
                  ),),
                )
            );
        }
        },
    );
  }
}
