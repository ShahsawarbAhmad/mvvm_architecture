import 'package:flutter/material.dart';
import 'package:mvvm_architecture/res/color.dart';
import 'package:mvvm_architecture/res/components/round_button.dart';
import 'package:mvvm_architecture/utils/routes/routes_name.dart';
import 'package:mvvm_architecture/utils/utils.dart';
import 'package:mvvm_architecture/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginView> {
  final ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _obsecurePassword.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Login",
            style: TextStyle(color: AppColors.whiteColor),
          ),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                focusNode: emailFocusNode,
                decoration: const InputDecoration(
                    hintText: 'Email', prefixIcon: Icon(Icons.email_outlined)),
                onFieldSubmitted: (value) {
                  Utils.fieldFocudeChange(
                      context, emailFocusNode, passwordFocusNode);
                },
              ),
              ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _passwordController,
                    obscureText: _obsecurePassword.value,
                    focusNode: passwordFocusNode,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: const Icon(Icons.lock_open_outlined),
                        suffixIcon: InkWell(
                            onTap: () {
                              _obsecurePassword.value =
                                  !_obsecurePassword.value;
                            },
                            child: _obsecurePassword.value
                                ? const Icon(Icons.visibility_off_outlined)
                                : const Icon(Icons.visibility))),
                  );
                },
              ),
              SizedBox(
                height: height * .087,
              ),
              RoundButton(
                  title: "Login",
                  loading: authViewModel.loading,
                  onPress: () {
                    if (_emailController.text.isEmpty) {
                      Utils.flushBarErrorMessage("Please Enter email", context);
                    } else if (_passwordController.text.isEmpty) {
                      Utils.flushBarErrorMessage(
                          "Please Enter password", context);
                    } else if (_passwordController.text.length < 6) {
                      Utils.flushBarErrorMessage(
                          "Please Enter 6 digit password", context);
                    } else {
                      // Map data = {
                      //   'email': _emailController.text.toString(),
                      //   'password': _passwordController.text.toString(),
                      // };
                      Map data = {
                        'email': 'eve.holt@reqres.in',
                        'password': 'cityslicka',
                      };
                      authViewModel.loginApi(data, context);
                      print("api hit");
                    }
                  }),
              SizedBox(
                height: height * 0.04,
              ),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.signUp);
                  },
                  child: const Text("Don't have an account? SignUp")),
            ],
          ),
        ));
  }
}
