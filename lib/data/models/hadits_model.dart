
class haditsModel {
  final int id;
  final String hadithNumber;
  final String hadithTitle;
  final String hadithArabic;
  final String hadithTranslation;
  final String nameAudio;
  final int favoriteState;

  haditsModel({
    required this.id,
    required this.hadithNumber,
    required this.hadithTitle,
    required this.hadithArabic,
    required this.hadithTranslation,
    required this.nameAudio,
    required this.favoriteState,
  });

  factory haditsModel.fromMap(Map <String, dynamic> map){
    return haditsModel(
        id: map ['id'] as int  ,
        hadithNumber: map ['hadith_number']as String ,
        hadithTitle: map['hadith_title']as String,
        hadithArabic:map ['hadith_arabic']as String,
        hadithTranslation: map ['hadith_translation']as String,
        nameAudio: map ['name_audio'] as String,
        favoriteState: map ['favorite_state'] as int,
    );
  }
}
