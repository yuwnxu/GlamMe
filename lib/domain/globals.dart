import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glamme/presentation/mainScreens/auth/register.dart';
import 'package:glamme/presentation/mainScreens/auth/signIn.dart';
import 'package:glamme/presentation/mainScreens/mainPage.dart';
import 'package:glamme/presentation/mainScreens/sections/cart.dart';
import 'package:glamme/presentation/mainScreens/sections/categories.dart';
import 'package:glamme/presentation/mainScreens/sections/favorite.dart';
import 'package:glamme/presentation/mainScreens/sections/home.dart';
import 'package:glamme/presentation/mainScreens/sections/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Основные переменные и функии приложения

// Выбранный индекс
int currentIndex = 0;
int selectedCategories = 0;

// Навигация
void navToSignIn(context) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignIn()));
  clearControllers();
  clearErrors();
}

void navToReg(context) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Register()));
  clearControllers();
  clearErrors();
}

void navToHome(context) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainPage(selectedIndex: 0)));
  clearControllers();
  clearErrors();
}

void navToFavorite(context) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainPage(selectedIndex: 1)));
}

void navToCart(context) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainPage(selectedIndex: 2)));
}

void navToProfile(context) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainPage(selectedIndex: 3)));
}

void navToCategories(context) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Categories()));
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

// Виджет переключения страниц
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
void animateToCategory() {
  categoryController.animateToPage(selectedCategories, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
}

// Списки
var categoryList = [];
var productsList = [];

List<String> icons = ['assets/images/home.png', 'assets/images/favorite.png', 'assets/images/cart.png', 'assets/images/profile.png'];

List<String> selectedIcons = ['assets/images/selected-home.png', 'assets/images/selected-favorite.png', 'assets/images/selected-cart.png', 'assets/images/selected-profile.png'];

// List<String> categoryList = ['Акции', 'Макияж', 'Уход', 'Прочее'];

// Контроллеры
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController nameController = TextEditingController();
PageController categoryController = PageController();

// Текст ошибки
String? emailError;
String? passwordError;
String? nameError;


//
void initPrefs() async {
  prefs = await SharedPreferences.getInstance();
}

late SharedPreferences prefs;

