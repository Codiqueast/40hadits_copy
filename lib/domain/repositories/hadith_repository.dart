import '../entities/hadith_entity.dart';

abstract class hadithRepository{
  Future<List<HadithEntity>> getAllHadith();

  Future <HadithEntity> getHadithById({required int hadithId});

  Future<List<HadithEntity>> getAllFavoriteHadiths();

  Future<void> addRemoveFavorite({required int hadithId, required int favoriteState});

  Future<int> getFavoriteState({required int hadithId});

}
