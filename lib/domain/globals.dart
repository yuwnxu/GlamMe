import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glamme/presentation/mainScreens/auth/register.dart';
import 'package:glamme/presentation/mainScreens/auth/signIn.dart';
import 'package:glamme/presentation/mainScreens/mainPage.dart';
import 'package:glamme/presentation/mainScreens/sections/cart.dart';
import 'package:glamme/presentation/mainScreens/sections/favorite.dart';
import 'package:glamme/presentation/mainScreens/sections/home.dart';
import 'package:glamme/presentation/mainScreens/sections/profile.dart';

// Основные переменные и функии приложения

//
int currentIndex = 0;

// Навигация
void navToSignIn(context) {
  Navigator.of(
    context,
  ).pushReplacement(MaterialPageRoute(builder: (context) => SignIn()));
  clearControllers();
  clearErrors();
}

void navToReg(context) {
  Navigator.of(
    context,
  ).pushReplacement(MaterialPageRoute(builder: (context) => Register()));
  clearControllers();
  clearErrors();
}

void navToHome(context) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => MainPage(selectedIndex: 0)),
  );
  clearControllers();
  clearErrors();
}

void navToFavorite(context) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => MainPage(selectedIndex: 1)),
  );
}

void navToCart(context) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => MainPage(selectedIndex: 2)),
  );
}

void navToProfile(context) {
  Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => MainPage(selectedIndex: 3)),
  );
}

// Очистка контроллеров
void clearControllers() {
  emailController.clear();
  passwordController.clear();
  nameController.clear();
}

// Очистка ошибок
void clearErrors() {
  emailError = null;
  nameError = null;
  passwordError = null;
}

//
Widget selectPage(currentIndex) {
  switch (currentIndex) {
    case 0:
      return Home();
    case 1:
      return Favorite();
    case 2:
      return Cart();
    case 3:
      return Profile();
    default:
      return Home();
  }
}

//
List<String> icons = [
  'assets/images/home.png',
  'assets/images/favorite.png',
  'assets/images/cart.png',
  'assets/images/profile.png',
];
List<String> selectedIcons = [
  'assets/images/selected-home.png',
  'assets/images/selected-favorite.png',
  'assets/images/selected-cart.png',
  'assets/images/selected-profile.png',
];

// Контроллеры
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController nameController = TextEditingController();

// Текст ошибки
String? emailError;
String? passwordError;
String? nameError;
