import 'package:flutter/foundation.dart';

import 'meaning.dart';
import 'phonetic.dart';

@immutable
class Translation {
  final String? word;
  final String? phonetic;
  final List<Phonetic>? phonetics;
  final String? origin;
  final List<Meaning>? meanings;

  const Translation({
    this.word,
    this.phonetic,
    this.phonetics,
    this.origin,
    this.meanings,
  });

  @override
  String toString() {
    return 'Translation(word: $word, phonetic: $phonetic, phonetics: $phonetics, origin: $origin, meanings: $meanings)';
  }

  factory Translation.fromWordCatPhoneticKatPhoneticsTextKatAudioSslGstaticComDictionaryStaticSounds20200429CatGb1Mp3OriginOldEnglishCattCatteOfGermanicOriginRelatedToDutchKatAndGermanKatzeReinforcedInMiddleEnglishByFormsFromLateLatinCattusMeaningsPartOfSpeechNounDefinitionsDefinitionASmallDomesticatedCarnivorousMammalWithSoftFurAShortSnoutAndRetractableClawsItIsWidelyKeptAsAPetOrForCatchingMiceAndManyBreedsHaveBeenDevelopedSynonymsFelinePussycatPussyPussKittyKittyCatKittenTiddlesTibblesTomTomcatTabbyGingerTortoiseshellMarmaladeCatMouserHouseCatWildCatAlleyCatMoggieMogFurBabyFurKidGrimalkinAntonymsDefinitionEspeciallyAmongJazzEnthusiastsAManExampleThisWestCoastCatHadManagedHimSinceTheEarly80sSynonymsAntonymsDefinitionAShortTaperedStickUsedInTheGameOfTipcatSynonymsAntonymsPartOfSpeechVerbDefinitionsDefinitionRaiseAnAnchorFromTheSurfaceOfTheWaterToTheCatheadExampleIKeptHerOffTheWindAndSailingFreeUntilIHadTheAnchorCattedSynonymsAntonyms(
      Map<String, dynamic> json) {
    return Translation(
      word: json['word'] as String?,
      phonetic: json['phonetic'] as String?,
      phonetics: (json['phonetics'] as List<dynamic>?)
          ?.map((e) => Phonetic
              .fromWordCatPhoneticKatPhoneticsTextKatAudioSslGstaticComDictionaryStaticSounds20200429CatGb1Mp3OriginOldEnglishCattCatteOfGermanicOriginRelatedToDutchKatAndGermanKatzeReinforcedInMiddleEnglishByFormsFromLateLatinCattusMeaningsPartOfSpeechNounDefinitionsDefinitionASmallDomesticatedCarnivorousMammalWithSoftFurAShortSnoutAndRetractableClawsItIsWidelyKeptAsAPetOrForCatchingMiceAndManyBreedsHaveBeenDevelopedSynonymsFelinePussycatPussyPussKittyKittyCatKittenTiddlesTibblesTomTomcatTabbyGingerTortoiseshellMarmaladeCatMouserHouseCatWildCatAlleyCatMoggieMogFurBabyFurKidGrimalkinAntonymsDefinitionEspeciallyAmongJazzEnthusiastsAManExampleThisWestCoastCatHadManagedHimSinceTheEarly80sSynonymsAntonymsDefinitionAShortTaperedStickUsedInTheGameOfTipcatSynonymsAntonymsPartOfSpeechVerbDefinitionsDefinitionRaiseAnAnchorFromTheSurfaceOfTheWaterToTheCatheadExampleIKeptHerOffTheWindAndSailingFreeUntilIHadTheAnchorCattedSynonymsAntonyms(
                  e as Map<String, dynamic>))
          .toList(),
      origin: json['origin'] as String?,
      meanings: (json['meanings'] as List<dynamic>?)
          ?.map((e) => Meaning
              .fromWordCatPhoneticKatPhoneticsTextKatAudioSslGstaticComDictionaryStaticSounds20200429CatGb1Mp3OriginOldEnglishCattCatteOfGermanicOriginRelatedToDutchKatAndGermanKatzeReinforcedInMiddleEnglishByFormsFromLateLatinCattusMeaningsPartOfSpeechNounDefinitionsDefinitionASmallDomesticatedCarnivorousMammalWithSoftFurAShortSnoutAndRetractableClawsItIsWidelyKeptAsAPetOrForCatchingMiceAndManyBreedsHaveBeenDevelopedSynonymsFelinePussycatPussyPussKittyKittyCatKittenTiddlesTibblesTomTomcatTabbyGingerTortoiseshellMarmaladeCatMouserHouseCatWildCatAlleyCatMoggieMogFurBabyFurKidGrimalkinAntonymsDefinitionEspeciallyAmongJazzEnthusiastsAManExampleThisWestCoastCatHadManagedHimSinceTheEarly80sSynonymsAntonymsDefinitionAShortTaperedStickUsedInTheGameOfTipcatSynonymsAntonymsPartOfSpeechVerbDefinitionsDefinitionRaiseAnAnchorFromTheSurfaceOfTheWaterToTheCatheadExampleIKeptHerOffTheWindAndSailingFreeUntilIHadTheAnchorCattedSynonymsAntonyms(
                  e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic>
      toWordCatPhoneticKatPhoneticsTextKatAudioSslGstaticComDictionaryStaticSounds20200429CatGb1Mp3OriginOldEnglishCattCatteOfGermanicOriginRelatedToDutchKatAndGermanKatzeReinforcedInMiddleEnglishByFormsFromLateLatinCattusMeaningsPartOfSpeechNounDefinitionsDefinitionASmallDomesticatedCarnivorousMammalWithSoftFurAShortSnoutAndRetractableClawsItIsWidelyKeptAsAPetOrForCatchingMiceAndManyBreedsHaveBeenDevelopedSynonymsFelinePussycatPussyPussKittyKittyCatKittenTiddlesTibblesTomTomcatTabbyGingerTortoiseshellMarmaladeCatMouserHouseCatWildCatAlleyCatMoggieMogFurBabyFurKidGrimalkinAntonymsDefinitionEspeciallyAmongJazzEnthusiastsAManExampleThisWestCoastCatHadManagedHimSinceTheEarly80sSynonymsAntonymsDefinitionAShortTaperedStickUsedInTheGameOfTipcatSynonymsAntonymsPartOfSpeechVerbDefinitionsDefinitionRaiseAnAnchorFromTheSurfaceOfTheWaterToTheCatheadExampleIKeptHerOffTheWindAndSailingFreeUntilIHadTheAnchorCattedSynonymsAntonyms() {
    return {
      'word': word,
      'phonetic': phonetic,
      'phonetics': phonetics
          ?.map((e) => e
              .toWordCatPhoneticKatPhoneticsTextKatAudioSslGstaticComDictionaryStaticSounds20200429CatGb1Mp3OriginOldEnglishCattCatteOfGermanicOriginRelatedToDutchKatAndGermanKatzeReinforcedInMiddleEnglishByFormsFromLateLatinCattusMeaningsPartOfSpeechNounDefinitionsDefinitionASmallDomesticatedCarnivorousMammalWithSoftFurAShortSnoutAndRetractableClawsItIsWidelyKeptAsAPetOrForCatchingMiceAndManyBreedsHaveBeenDevelopedSynonymsFelinePussycatPussyPussKittyKittyCatKittenTiddlesTibblesTomTomcatTabbyGingerTortoiseshellMarmaladeCatMouserHouseCatWildCatAlleyCatMoggieMogFurBabyFurKidGrimalkinAntonymsDefinitionEspeciallyAmongJazzEnthusiastsAManExampleThisWestCoastCatHadManagedHimSinceTheEarly80sSynonymsAntonymsDefinitionAShortTaperedStickUsedInTheGameOfTipcatSynonymsAntonymsPartOfSpeechVerbDefinitionsDefinitionRaiseAnAnchorFromTheSurfaceOfTheWaterToTheCatheadExampleIKeptHerOffTheWindAndSailingFreeUntilIHadTheAnchorCattedSynonymsAntonyms())
          .toList(),
      'origin': origin,
      'meanings': meanings
          ?.map((e) => e
              .toWordCatPhoneticKatPhoneticsTextKatAudioSslGstaticComDictionaryStaticSounds20200429CatGb1Mp3OriginOldEnglishCattCatteOfGermanicOriginRelatedToDutchKatAndGermanKatzeReinforcedInMiddleEnglishByFormsFromLateLatinCattusMeaningsPartOfSpeechNounDefinitionsDefinitionASmallDomesticatedCarnivorousMammalWithSoftFurAShortSnoutAndRetractableClawsItIsWidelyKeptAsAPetOrForCatchingMiceAndManyBreedsHaveBeenDevelopedSynonymsFelinePussycatPussyPussKittyKittyCatKittenTiddlesTibblesTomTomcatTabbyGingerTortoiseshellMarmaladeCatMouserHouseCatWildCatAlleyCatMoggieMogFurBabyFurKidGrimalkinAntonymsDefinitionEspeciallyAmongJazzEnthusiastsAManExampleThisWestCoastCatHadManagedHimSinceTheEarly80sSynonymsAntonymsDefinitionAShortTaperedStickUsedInTheGameOfTipcatSynonymsAntonymsPartOfSpeechVerbDefinitionsDefinitionRaiseAnAnchorFromTheSurfaceOfTheWaterToTheCatheadExampleIKeptHerOffTheWindAndSailingFreeUntilIHadTheAnchorCattedSynonymsAntonyms())
          .toList(),
    };
  }

  Translation copyWith({
    String? word,
    String? phonetic,
    List<Phonetic>? phonetics,
    String? origin,
    List<Meaning>? meanings,
  }) {
    return Translation(
      word: word ?? this.word,
      phonetic: phonetic ?? this.phonetic,
      phonetics: phonetics ?? this.phonetics,
      origin: origin ?? this.origin,
      meanings: meanings ?? this.meanings,
    );
  }
}
