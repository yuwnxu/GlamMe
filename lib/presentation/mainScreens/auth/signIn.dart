import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:glamme/data/data.dart';
import 'package:glamme/domain/globals.dart';
import 'package:glamme/presentation/uikit/colors.dart';
import 'package:glamme/presentation/uikit/custom_button.dart';
import 'package:glamme/presentation/uikit/custom_textfield.dart';
import 'package:google_fonts/google_fonts.dart';

// Экран SignIn
class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  void initState() {
    super.initState();
    emailController.addListener(updateWidget);
    passwordController.addListener(updateWidget);
  }

  void updateWidget() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    emailController.removeListener(updateWidget);
    passwordController.removeListener(updateWidget);
  }

  void test() {
    setState(() {
      if (emailController.text.isEmpty) {
        emailError = 'Введите почту!';
      } else {
        emailError = null;
      }
      if (passwordController.text.isEmpty) {
        passwordError = 'Введите пароль!';
      } else {
        passwordError = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                SizedBox(height: 20),
                Row(
                  children: [
                    Spacer(),
                    Text('Вход', style: GoogleFonts.sulphurPoint(color: gray, fontSize: 28)),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 160),
                CustomTextField(
                  type: TextFieldType.text,
                  controller: emailController,
                  colorBorder: border,
                  colorFocus: black,
                  colorError: error,
                  title: 'Почта',
                  hintText: 'name@mail.com',
                  errorText: emailError,
                  borderRadius: 15,
                  colorCursor: black,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  type: TextFieldType.password,
                  controller: passwordController,
                  colorBorder: border,
                  colorFocus: black,
                  colorError: error,
                  title: 'Пароль',
                  hintText: '**********',
                  errorText: passwordError,
                  borderRadius: 15,
                  colorCursor: black,
                ),
                SizedBox(height: 35),
                CustomButton(
                  textButton: 'Вход',
                  colorButton: black,
                  widthButton: 352,
                  heightButton: 47,
                  borderRadius: 20,
                  onButton: () {
                    test();
                    if (emailError == null && passwordError == null) {
                      authUser(context);
                    } else {
                      if (mounted) {
                        setState(() {});
                      }
                    }
                  },
                ),
                SizedBox(height: 15),
                RichText(
                  text: TextSpan(
                    text: 'Нет аккаунта? ',
                    style: GoogleFonts.sulphurPoint(fontSize: 15, color: hintText),
                    children: [
                      TextSpan(
                        text: 'Регистрация',
                        style: GoogleFonts.sulphurPoint(fontSize: 15, color: black),
                        recognizer: TapGestureRecognizer()..onTap = () => navToReg(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
