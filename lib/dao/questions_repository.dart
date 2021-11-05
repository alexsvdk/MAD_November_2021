import 'dart:async';
import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:worlds_factory/api/models/translation/translation.dart';
import 'package:supercharged/supercharged.dart';

const _translationsKey = 'trans';
const _sizeKey = 'size';
const _scoreKey = 'score';

final questionsRepositoryProvider = Provider((_) => QuestionsRepository());

class QuestionsRepository {
  QuestionsRepository() {
    _init();
  }

  Completer? _initCompleter = Completer();
  late final SharedPreferences _spref;

  final _translations = <String, Translation>{};
  var _scores = <String, int>{};
  int get wordsCount => _scores.length;

  Future<void> _init() async {
    _spref = await SharedPreferences.getInstance();
    _loadTranslations();
    _initCompleter?.complete();
    _initCompleter = null;
  }

  void _loadTranslations() {
    if (_spref.containsKey(_translationsKey)) {
      final raw = jsonDecode(jsonDecode(_spref.getString(_translationsKey)!));
      raw.forEach((key, value) => _translations[key] = Translation
          .fromWordCatPhoneticKatPhoneticsTextKatAudioSslGstaticComDictionaryStaticSounds20200429CatGb1Mp3OriginOldEnglishCattCatteOfGermanicOriginRelatedToDutchKatAndGermanKatzeReinforcedInMiddleEnglishByFormsFromLateLatinCattusMeaningsPartOfSpeechNounDefinitionsDefinitionASmallDomesticatedCarnivorousMammalWithSoftFurAShortSnoutAndRetractableClawsItIsWidelyKeptAsAPetOrForCatchingMiceAndManyBreedsHaveBeenDevelopedSynonymsFelinePussycatPussyPussKittyKittyCatKittenTiddlesTibblesTomTomcatTabbyGingerTortoiseshellMarmaladeCatMouserHouseCatWildCatAlleyCatMoggieMogFurBabyFurKidGrimalkinAntonymsDefinitionEspeciallyAmongJazzEnthusiastsAManExampleThisWestCoastCatHadManagedHimSinceTheEarly80sSynonymsAntonymsDefinitionAShortTaperedStickUsedInTheGameOfTipcatSynonymsAntonymsPartOfSpeechVerbDefinitionsDefinitionRaiseAnAnchorFromTheSurfaceOfTheWaterToTheCatheadExampleIKeptHerOffTheWindAndSailingFreeUntilIHadTheAnchorCattedSynonymsAntonyms(
              value));
    }
    if (_spref.containsKey(_scoreKey)) {
      final raw =
          jsonDecode(_spref.getString(_scoreKey)!) as Map<String, dynamic>;
      raw.forEach((key, value) {
        _scores[key] = value as int;
      });
    }
  }

  Future<void> _save() async {
    await _initCompleter?.future;
    final raw = <String, Map<String, dynamic>>{};
    _translations.forEach((key, value) {
      raw[key] = value
          .toWordCatPhoneticKatPhoneticsTextKatAudioSslGstaticComDictionaryStaticSounds20200429CatGb1Mp3OriginOldEnglishCattCatteOfGermanicOriginRelatedToDutchKatAndGermanKatzeReinforcedInMiddleEnglishByFormsFromLateLatinCattusMeaningsPartOfSpeechNounDefinitionsDefinitionASmallDomesticatedCarnivorousMammalWithSoftFurAShortSnoutAndRetractableClawsItIsWidelyKeptAsAPetOrForCatchingMiceAndManyBreedsHaveBeenDevelopedSynonymsFelinePussycatPussyPussKittyKittyCatKittenTiddlesTibblesTomTomcatTabbyGingerTortoiseshellMarmaladeCatMouserHouseCatWildCatAlleyCatMoggieMogFurBabyFurKidGrimalkinAntonymsDefinitionEspeciallyAmongJazzEnthusiastsAManExampleThisWestCoastCatHadManagedHimSinceTheEarly80sSynonymsAntonymsDefinitionAShortTaperedStickUsedInTheGameOfTipcatSynonymsAntonymsPartOfSpeechVerbDefinitionsDefinitionRaiseAnAnchorFromTheSurfaceOfTheWaterToTheCatheadExampleIKeptHerOffTheWindAndSailingFreeUntilIHadTheAnchorCattedSynonymsAntonyms();
    });
    await _spref.setString(_translationsKey, jsonEncode(jsonEncode(raw)));
    await _spref.setInt(_sizeKey, _translations.length);
    await _spref.setString(_scoreKey, jsonEncode(_scores));
  }

  Future<void> addWord(Translation translation) async {
    if (_scores[translation.word!] == null) {
      _translations[translation.word!] = translation;
      _scores[translation.word!] = 0;
      await _save();
    }
  }

  Future<List<Translation>> getTest() async {
    await _initCompleter?.future;
    var keys = (_scores.entries.toList()
          ..sort((a, b) => a.value.compareTo(b.value)))
        .map((e) => e.key)
        .toList();

    if (keys.length > 10) {
      keys = keys.sublist(0, 10);
    }
    return (keys..shuffle()).map((key) => _translations[key]!).toList();
  }

  Future<void> incScore(String word) async {
    _scores[word] = (_scores[word] ?? 0) + 1;
    await _save();
  }

  Future<void> deScore(String word) async {
    _scores[word] = (_scores[word] ?? 0) - 1;
    await _save();
  }
}
