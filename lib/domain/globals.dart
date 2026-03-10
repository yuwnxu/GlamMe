import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glamme/presentation/mainScreens/auth/register.dart';
import 'package:glamme/presentation/mainScreens/auth/signIn.dart';
import 'package:glamme/presentation/mainScreens/home.dart';

// Основные переменные и функии приложения

// Навигация
void navToSignIn(context) {
  Navigator.of(
    context,
  ).pushReplacement(MaterialPageRoute(builder: (context) => SignIn()));
  clearControllers();
}

void navToReg(context) {
  Navigator.of(
    context,
  ).pushReplacement(MaterialPageRoute(builder: (context) => Register()));
  clearControllers();
}

void navToHome(context) {
  Navigator.of(
    context,
  ).pushReplacement(MaterialPageRoute(builder: (context) => Home()));
  clearControllers();
}

// Очистка контроллеров
void clearControllers() {
  emailController.clear();
  passwordController.clear();
  nameController.clear();
}

// Контроллеры
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController nameController = TextEditingController();

// Текст ошибки
String? emailError;
String? passwordError;
String? nameError;

