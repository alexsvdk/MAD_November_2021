import 'package:flutter/foundation.dart';

@immutable
class Definition {
  final String? definition;
  final List<String>? synonyms;
  final List<dynamic>? antonyms;

  const Definition({this.definition, this.synonyms, this.antonyms});

  @override
  String toString() {
    return 'Definition(definition: $definition, synonyms: $synonyms, antonyms: $antonyms)';
  }

  factory Definition.fromWordCatPhoneticKatPhoneticsTextKatAudioSslGstaticComDictionaryStaticSounds20200429CatGb1Mp3OriginOldEnglishCattCatteOfGermanicOriginRelatedToDutchKatAndGermanKatzeReinforcedInMiddleEnglishByFormsFromLateLatinCattusMeaningsPartOfSpeechNounDefinitionsDefinitionASmallDomesticatedCarnivorousMammalWithSoftFurAShortSnoutAndRetractableClawsItIsWidelyKeptAsAPetOrForCatchingMiceAndManyBreedsHaveBeenDevelopedSynonymsFelinePussycatPussyPussKittyKittyCatKittenTiddlesTibblesTomTomcatTabbyGingerTortoiseshellMarmaladeCatMouserHouseCatWildCatAlleyCatMoggieMogFurBabyFurKidGrimalkinAntonymsDefinitionEspeciallyAmongJazzEnthusiastsAManExampleThisWestCoastCatHadManagedHimSinceTheEarly80sSynonymsAntonymsDefinitionAShortTaperedStickUsedInTheGameOfTipcatSynonymsAntonymsPartOfSpeechVerbDefinitionsDefinitionRaiseAnAnchorFromTheSurfaceOfTheWaterToTheCatheadExampleIKeptHerOffTheWindAndSailingFreeUntilIHadTheAnchorCattedSynonymsAntonyms(
      Map<String, dynamic> json) {
    return Definition(
      definition: json['definition'] as String?,
      antonyms: json['antonyms'] as List<dynamic>?,
    );
  }

  Map<String, dynamic>
      toWordCatPhoneticKatPhoneticsTextKatAudioSslGstaticComDictionaryStaticSounds20200429CatGb1Mp3OriginOldEnglishCattCatteOfGermanicOriginRelatedToDutchKatAndGermanKatzeReinforcedInMiddleEnglishByFormsFromLateLatinCattusMeaningsPartOfSpeechNounDefinitionsDefinitionASmallDomesticatedCarnivorousMammalWithSoftFurAShortSnoutAndRetractableClawsItIsWidelyKeptAsAPetOrForCatchingMiceAndManyBreedsHaveBeenDevelopedSynonymsFelinePussycatPussyPussKittyKittyCatKittenTiddlesTibblesTomTomcatTabbyGingerTortoiseshellMarmaladeCatMouserHouseCatWildCatAlleyCatMoggieMogFurBabyFurKidGrimalkinAntonymsDefinitionEspeciallyAmongJazzEnthusiastsAManExampleThisWestCoastCatHadManagedHimSinceTheEarly80sSynonymsAntonymsDefinitionAShortTaperedStickUsedInTheGameOfTipcatSynonymsAntonymsPartOfSpeechVerbDefinitionsDefinitionRaiseAnAnchorFromTheSurfaceOfTheWaterToTheCatheadExampleIKeptHerOffTheWindAndSailingFreeUntilIHadTheAnchorCattedSynonymsAntonyms() {
    return {
      'definition': definition,
      'synonyms': synonyms,
      'antonyms': antonyms,
    };
  }

  Definition copyWith({
    String? definition,
    List<String>? synonyms,
    List<dynamic>? antonyms,
  }) {
    return Definition(
      definition: definition ?? this.definition,
      synonyms: synonyms ?? this.synonyms,
      antonyms: antonyms ?? this.antonyms,
    );
  }
}
