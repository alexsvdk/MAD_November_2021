import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

const _link =
    'https://learnenglish.britishcouncil.org/general-english/video-zone';

class VideoScreen extends HookWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      final plugin = FlutterWebviewPlugin();
      final stream = plugin.onUrlChanged.listen((url) {
        if (!url.contains(_link)) plugin.goBack();
      });
      return stream.cancel;
    });
    return const WebviewScaffold(
      url: _link,
    );
  }
}
