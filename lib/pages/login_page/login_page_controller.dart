import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:worlds_factory/pages/login_page/login_page_model.dart';

final loginPageControllerProvider =
    StateNotifierProvider.autoDispose<LoginPageController, LoginPageModel?>(
        (ref) => LoginPageController());

class LoginPageController extends StateNotifier<LoginPageModel?> {
  LoginPageController() : super(null);

  void doLogin(String name, String email, String password) {
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      state = LoginPageModel(false, 'Fields must not be empty');
      return;
    }
    state = LoginPageModel(true, null);
  }
}
