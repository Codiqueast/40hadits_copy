import 'package:hadits/domain/entities/hadith_entity.dart';

import '../repositories/hadith_repository.dart';

class HadithUseCase {
  late final hadithRepository _hadithRepository;
  HadithUseCase(this._hadithRepository);

  Future<List<HadithEntity>> fetchAllHadith() async {
    try {
      final List<HadithEntity> getAllHadith =
          await _hadithRepository.getAllHadith();
      return getAllHadith;
    } catch (e) {
      throw Exception('ошибка при получений хадисов из базы даных:\n\n $e ');
    }
  }

  Future<HadithEntity> fetchHadithById({required int hadithId}) async {
    try {
      final HadithEntity getHadithById = await _hadithRepository.getHadithById(
        hadithId: hadithId,
      );
      return getHadithById;
    } catch (e) {
      throw Exception('ошибка при получение хадиса по id\e\e$e ');
    }
  }
  Future<List<HadithEntity>> fetchFavoriteHadith() async {
    try {
      final List<HadithEntity> getFavoriteHadiths =
      await _hadithRepository.getAllFavoriteHadiths();
      return getFavoriteHadiths;
    } catch (e) {
      throw Exception('ошибка при получений избранных хадисов из базы даных:\n\n $e ');
    }
  }

  Future<void> fetchAddRemoveFavoriteHadith ({required int hadithId, required int favoriteState}) async {
    try{
      return await _hadithRepository.addRemoveFavorite(hadithId: hadithId, favoriteState: favoriteState);
    }catch (e){
      throw   Exception('ошибка при дабовлении/удалении хадиса из избранного:\n\n $e ');
    }
  }

  Future<int> fetchFavoriteState ({required int hadithId}) async {
    try{
      return await _hadithRepository.getFavoriteState(hadithId: hadithId);
    }catch (e){
      throw   Exception('ошибка при получений  избранного:\n\n $e ');
    }
  }

}
