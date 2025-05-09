import 'package:flutter/widgets.dart';
import 'package:hadits/data/repositories/hadits_data_repository.dart';
import 'package:hadits/domain/entities/hadith_entity.dart';
import 'package:hadits/domain/usecases/hadiths_use_case.dart';

class HadithDataState extends ChangeNotifier{

 final HadithUseCase hadithUseCase = HadithUseCase(HadithsDataRepository());

 Future<List<HadithEntity>> fetchAllHadiths() async {
   return await hadithUseCase.fetchAllHadith();
 }

 Future<HadithEntity> fetchHadithById({required int hadithId}) async {
   return await hadithUseCase.fetchHadithById(hadithId: hadithId);
 }

 Future<List<HadithEntity>> fetchFavoriteHadiths() async{
   return hadithUseCase.fetchFavoriteHadith();
}
Future<void> fetchAddRemoveFavorite({required int hadithId, required int favoriteState}) async{
   await hadithUseCase.fetchAddRemoveFavoriteHadith(hadithId: hadithId, favoriteState: favoriteState);
   notifyListeners();
}

Future<int> fetchFavoriteState ({required int hadithId}) async{
   final int favoriteState = await hadithUseCase.fetchFavoriteState(hadithId: hadithId);
   return favoriteState;
}

}