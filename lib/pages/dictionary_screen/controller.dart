import 'dart:developer';
import 'dart:io';

// ignore: import_of_legacy_library_into_null_safe
import 'package:audioplayers/audioplayers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:worlds_factory/api/api.dart';
import 'package:worlds_factory/api/models/api_error.dart';

import 'model.dart';

final dictionaryScreenControllerProvider = StateNotifierProvider.autoDispose<
        DictionaryScreenController, DictionaryScreenModel>(
    (ref) => DictionaryScreenController(ref.watch(apiProvider)));

class DictionaryScreenController extends StateNotifier<DictionaryScreenModel> {
  final Api _api;
  final AudioPlayer _player = AudioPlayer(mode: PlayerMode.LOW_LATENCY);

  DictionaryScreenController(this._api)
      : super(DictionaryScreenModel(
          null,
          null,
        ));

  void doSearch(String word) async {
    try {
      final res = await _api.getTranslations(word);
      state = DictionaryScreenModel(res, null);
    } on ApiError catch (e) {
      state = DictionaryScreenModel(null, e.title);
    } on SocketException catch (e) {
      state = DictionaryScreenModel(null, 'Ошибка подключения к сети');
    } catch (e) {
      log(e.toString());
      state = DictionaryScreenModel(null, 'Произошла ошибка');
    }
  }

  void playWord() {
    final url = state.data?.first.phonetics?.first.audio;
    if (url == null) return;
    _player.play('https:' + url);
  }

  void saveWord() {}
}
