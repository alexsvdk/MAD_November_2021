import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:worlds_factory/api/models/translation/meaning.dart';
import 'package:worlds_factory/common.dart';
import 'package:worlds_factory/common/button.dart';
import 'package:worlds_factory/pages/dictionary_screen/controller.dart';
import 'package:worlds_factory/pages/main_page/no_words.dart';

class DictionaryScreen extends HookWidget {
  const DictionaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();
    final controller = useProvider(dictionaryScreenControllerProvider.notifier);

    final state = useProvider(
            dictionaryScreenControllerProvider.select((value) => value.data)) ??
        List.empty();

    useEffect(() {
      final stream = controller.stream.listen((state) {
        if (state.error != null) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error ?? '')));
        }
      });
      return stream.cancel;
    });

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
                controller: searchController,
                decoration: kInputDecoration.copyWith(
                  suffixIcon: IconButton(
                    onPressed: () => controller.doSearch(searchController.text),
                    icon: Image.asset(
                      'assets/images/lupa.png',
                      width: 24,
                      height: 24,
                    ),
                  ),
                )),
            if (state.isEmpty) ...[
              Spacer(),
              NoWord(),
              Spacer(),
            ] else ...[
              const SizedBox(
                height: 16,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    state.first.word ?? '',
                    style: kH4TextStyle,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    '[${state.first.phonetic}]',
                    style: const TextStyle(color: KColors.primary),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  IconButton(
                      onPressed: controller.playWord,
                      icon: Image.asset(
                        'assets/images/sound.png',
                        height: 24,
                        width: 24,
                      )),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(children: [
                const Text(
                  'Part of Speech:',
                  style: kH4TextStyle,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  state.first.meanings?.first.partOfSpeech ?? '',
                ),
              ]),
              for (var meaning in state.first.meanings ?? [])
                _buildMeaning(meaning),
              Spacer(),
              KButton('Add to Dictionary', onClick: () {
                controller.saveWord();
              })
            ]
          ],
        ),
      ),
    );
  }

  Widget _buildMeaning(Meaning meaning) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: KColors.grey)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(meaning.definitions?.first.definition ?? ''),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: const [
              Text('Example: ', style: TextStyle(color: KColors.secondary)),
              SizedBox(
                width: 2,
              ),
              Text('there is no example'),
            ],
          )
        ],
      ),
    );
  }
}
