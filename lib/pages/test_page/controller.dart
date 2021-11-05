import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:worlds_factory/api/models/translation/meaning.dart';
import 'package:worlds_factory/api/models/translation/translation.dart';
import 'package:worlds_factory/dao/questions_repository.dart';
import 'package:worlds_factory/pages/test_page/model.dart';
import 'package:supercharged/supercharged.dart';

final testPageControllerProvider =
    StateNotifierProvider.autoDispose<TestPageController, TestPageModel?>(
        (ref) => TestPageController(ref.watch(questionsRepositoryProvider)));

class TestPageController extends StateNotifier<TestPageModel?> {
  final QuestionsRepository _repository;

  var _options = <Translation>[];
  var currIndex = 0;
  var trueIndex = 0;
  var _correct = 0;

  TestPageController(this._repository) : super(null) {
    startTest();
  }

  void startTest() async {
    _options = await _repository.getTest();
    currIndex = 0;
    _createQuestion();
  }

  void _createQuestion() {
    final word = _options[currIndex];
    final task = ((List.from(word.meanings!)..shuffle()).first as Meaning)
        .definitions
        ?.first
        .definition;
    var options = _options.map((e) => e.word!).toList()..shuffle();
    while (options.length < 3) {
      options.add('Apple');
    }
    options.remove(word.word);
    options = options.take(2).toList();
    options.add(word.word!);
    options.shuffle();

    trueIndex = options.indexOf(word.word!);

    state = TestPageModel(
      _options.length,
      currIndex + 1,
      question: task ?? '',
      answers: options,
    );
  }

  void answer(int index) {
    if (currIndex < _options.length) {
      if (trueIndex == index) {
        _correct++;
        _repository.incScore(_options[currIndex].word!);
      } else {
        _repository.deScore(_options[currIndex].word!);
      }
      _createQuestion();
    }
    currIndex++;
    if (currIndex >= _options.length) {
      _publishResuls();
    }
  }

  void _publishResuls() {
    state = TestPageModel(_options.length, currIndex + 1, correct: _correct);
  }
}
