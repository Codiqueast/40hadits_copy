
import 'package:hadits/data/models/hadits_model.dart';
import 'package:hadits/data/services/local/database_service.dart';
import 'package:hadits/domain/entities/hadith_entity.dart';
import 'package:sqflite/sqflite.dart';
import '../../domain/repositories/hadith_repository.dart';

class HadithsDataRepository implements hadithRepository {
  final DatabaseService _databaseService = DatabaseService();
  final String _tableName = 'Table_of_hadith';

  @override
  Future<List<HadithEntity>> getAllHadith() async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query(_tableName);
    final List<HadithEntity>
    allHadiths = resources.isNotEmpty ? resources.map((e)=> _entity(haditsModel.fromMap(e))).toList() : [];
    return allHadiths;
  }

  @override
  Future<HadithEntity> getHadithById({required int hadithId}) async {
    final Database database = await _databaseService.db;
    final List< Map <String, Object?>> resource = await database.query(_tableName, where: 'id = $hadithId');
    final HadithEntity? hadithById = resource.isNotEmpty ? _entity(haditsModel.fromMap(resource.first)): null;
    return hadithById!;
  }




  @override
  Future<List<HadithEntity>> getAllFavoriteHadiths() async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resource = await database.query(_tableName, where: 'favorite_state = 1');
    final List<HadithEntity> favoriteHadiths = resource.isNotEmpty? resource.map((e) => _entity(haditsModel.fromMap(e))).toList() : [];
    return favoriteHadiths;
  }

  @override
  Future<void> addRemoveFavorite({required int hadithId, required int favoriteState}) async {
    final Database database = await _databaseService.db;
    final Map<String, int> favorite = {
      "favorite_state": favoriteState,
    };
    await database.update(_tableName,  where: 'id =$hadithId', favorite);
  }

  @override
  Future<int> getFavoriteState({required int hadithId}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>>  resource = await database.query(_tableName, where: 'id = $hadithId', columns: ['favorite_state'] );
    final int FavoriteState = resource.first['favorite_state'] as int;
    return FavoriteState;
  }
}

  HadithEntity _entity(haditsModel model) {
    return HadithEntity(
        id: model.id,
        hadithNumber: model.hadithNumber,
        hadithTitle: model.hadithTitle,
        hadithArabic: model.hadithArabic,
        hadithTranslation: model.hadithTranslation,
        favoriteState: model.favoriteState,
        nameAudio: model.nameAudio);
  }

