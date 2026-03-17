import 'dart:convert';

import 'package:glamme/domain/globals.dart';
import 'package:service_glamme/network.dart';

// Работа с серверной частью

var network = Network();

void authUser(context) async {
  var response = await network.auth(emailController.text, passwordController.text);

  if (response['status'] == 'ok') {
    print('ok');
    navToHome(context);
  } else {
    print(response['msg']);
  }
}

//
void regUser(context) async {
  var response = await network.registration(nameController.text, passwordController.text, emailController.text);

  if (response['status'] == 'ok') {
    print('ok');
    navToHome(context);
  } else {
    print(response['msg']);
  }
}

void postCategories() async {
  var response = await network.get_categories();
  var categories = jsonDecode(response['data'].body);

  categoryList.clear();

  for (int i = 0; i < categories['categories'].length; i++) {
    categoryList.add(categories['categories'][i]);
  }
}

void loadProducts() {}
