import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:worlds_factory/api/models/api_error.dart';
import 'package:worlds_factory/api/models/translation/translation.dart';
import 'package:http/http.dart' as http;

final apiProvider = Provider((_) => Api());

class Api {
  Future<List<Translation>> getTranslations(String word) async {
    final uri = Uri.https('api.dictionaryapi.dev', '/api/v2/entries/en/$word');
    final res =
        await http.get(uri, headers: {'Content-Type': 'application/json'});
    if (res.statusCode == 200) {
      return (jsonDecode(res.body) as List<dynamic>)
          .map((e) => Translation
              .fromWordCatPhoneticKatPhoneticsTextKatAudioSslGstaticComDictionaryStaticSounds20200429CatGb1Mp3OriginOldEnglishCattCatteOfGermanicOriginRelatedToDutchKatAndGermanKatzeReinforcedInMiddleEnglishByFormsFromLateLatinCattusMeaningsPartOfSpeechNounDefinitionsDefinitionASmallDomesticatedCarnivorousMammalWithSoftFurAShortSnoutAndRetractableClawsItIsWidelyKeptAsAPetOrForCatchingMiceAndManyBreedsHaveBeenDevelopedSynonymsFelinePussycatPussyPussKittyKittyCatKittenTiddlesTibblesTomTomcatTabbyGingerTortoiseshellMarmaladeCatMouserHouseCatWildCatAlleyCatMoggieMogFurBabyFurKidGrimalkinAntonymsDefinitionEspeciallyAmongJazzEnthusiastsAManExampleThisWestCoastCatHadManagedHimSinceTheEarly80sSynonymsAntonymsDefinitionAShortTaperedStickUsedInTheGameOfTipcatSynonymsAntonymsPartOfSpeechVerbDefinitionsDefinitionRaiseAnAnchorFromTheSurfaceOfTheWaterToTheCatheadExampleIKeptHerOffTheWindAndSailingFreeUntilIHadTheAnchorCattedSynonymsAntonyms(
                  e))
          .toList();
    } else {
      throw ApiError
          .fromTitleNoDefinitionsFoundMessageSorryPalWeCouldnTFindDefinitionsForTheWordYouWereLookingForResolutionYouCanTryTheSearchAgainAtLaterTimeOrHeadToTheWebInstead(
              jsonDecode(res.body));
    }
  }
}
