// Основные переменные и функии приложения

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glamme/presentation/mainScreens/auth/register.dart';
import 'package:glamme/presentation/mainScreens/auth/signIn.dart';

// Навигация
void navToSignIn(context) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignIn()));
}

void navToReg(context) {
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Register()));
}