import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:glamme/data/data.dart';
import 'package:glamme/domain/globals.dart';
import 'package:glamme/presentation/uikit/colors.dart';
import 'package:glamme/presentation/uikit/custom_button.dart';
import 'package:glamme/presentation/uikit/custom_textfield.dart';
import 'package:google_fonts/google_fonts.dart';

// Экран Register
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  void initState() {
    super.initState();
    emailController.addListener(updateWidget);
    passwordController.addListener(updateWidget);
    nameController.addListener(updateWidget);
  }

  void updateWidget() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    emailController.removeListener(updateWidget);
    passwordController.removeListener(updateWidget);
    nameController.removeListener(updateWidget);
  }

  void test() {
    setState(() {
      if (nameController.text.isEmpty) {
        nameError = 'Введите имя!';
      } else {
        nameError = null;
      }

      if (emailController.text.isEmpty) {
        emailError = 'Введите почту!';
      } else if (!emailController.text.contains('@')) {
        emailError = 'Введите корректную почту (должна содержать @)';
      } else {
        emailError = null;
      }

      if (passwordController.text.isEmpty) {
        passwordError = 'Введите пароль!';
      } else if (passwordController.text.length < 6) {
        passwordError = 'Пароль должен быть не менее 6 символов';
      } else {
        passwordError = null;
      }
    });
  }

  void localRegister() async { // локальная регистрация
    test();

    if (emailError == null && passwordError == null && nameError == null) {
      await prefs.setString('email', emailController.text);
      await prefs.setString('password', passwordController.text);
      await prefs.setString('name', nameController.text);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Регистрация прошла успешно!'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 1),
          ),
        );
        navToHome(context);
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Исправьте ошибки в форме'),
            backgroundColor: error,
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
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
                    Text('Регистрация', style: GoogleFonts.sulphurPoint(color: gray, fontSize: 28)),
                    Spacer(),
                  ],
                ),
                SizedBox(height: 130),
                CustomTextField(
                  type: TextFieldType.text,
                  controller: nameController,
                  colorBorder: border,
                  colorFocus: black,
                  colorError: error,
                  title: 'Имя',
                  hintText: 'Введите имя',
                  errorText: nameError,
                  borderRadius: 15,
                  colorCursor: black,
                ),
                SizedBox(height: 20),
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
                  textButton: 'РЕГИСТРАЦИЯ',
                  colorButton: black,
                  widthButton: 352,
                  heightButton: 47,
                  borderRadius: 20,
                  onButton: () {
                    localRegister();
                  },
                ),
                SizedBox(height: 15),
                RichText(
                  text: TextSpan(
                    text: 'Есть аккаунт? ',
                    style: GoogleFonts.sulphurPoint(fontSize: 15, color: hintText),
                    children: [
                      TextSpan(
                        text: 'Войти',
                        style: GoogleFonts.sulphurPoint(fontSize: 15, color: black),
                        recognizer: TapGestureRecognizer()..onTap = () => navToSignIn(context),
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