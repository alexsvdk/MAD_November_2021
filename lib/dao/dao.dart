import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class Dao {
  final _initCompleter = Completer();
  late final SharedPreferences _spref;

  Future get init => _initCompleter.future;
}
