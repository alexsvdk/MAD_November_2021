import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:worlds_factory/common.dart';
import 'package:worlds_factory/common/button.dart';
import 'package:worlds_factory/pages/login_page/login_page_controller.dart';
import 'package:worlds_factory/pages/main_page/main_page.dart';

class LoginPage extends HookWidget {
  LoginPage({Key? key}) : super(key: key);

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final showPassword = useState(false);
    final loginPageController =
        useProvider(loginPageControllerProvider.notifier);

    useEffect(() {
      final stream = loginPageController.stream.listen((state) {
        if (state == null) return;
        if (state.sussess) {
          context.navigateReplacement(const MainPage());
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMessage ?? '')));
        }
      });
      return stream.cancel;
    });

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/sign_up.png'),
            const SizedBox(
              height: 16,
            ),
            const Text('Sign up', style: kH4TextStyle),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Create your account',
              style: TextStyle(color: KColors.grey),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: nameController,
              decoration: kInputDecoration.copyWith(hintText: 'Name'),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: emailController,
              decoration: kInputDecoration.copyWith(hintText: 'Email'),
            ),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: passwordController,
              decoration: kInputDecoration.copyWith(hintText: 'Password'),
            ),
            const SizedBox(
              height: 16,
            ),
            KButton('Sign up', onClick: () {
              loginPageController.doLogin(
                nameController.text,
                emailController.text,
                passwordController.text,
              );
            }),
          ],
        ),
      ),
    );
  }
}
