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

// Список избранных товаров
List<String> favoriteIds = [];

// Проверка: в избранном ли товар
bool isFavorite(String id) {
  return favoriteIds.contains(id);
}

// Добавить/удалить из избранного
void toggleFavorite(String id) {
  if (isFavorite(id)) {
    favoriteIds.remove(id);
  } else {
    favoriteIds.add(id);
  }
}


// Список всех товаров
List<Map<String, String>> allProducts = [
  // уход
  {'id': '1', 'image': 'assets/images/cream.png', 'name': 'Крем для лица', 'category': 'Уход', 'price': '990', 'isSale': 'true', 'oldPrice': '1890'},
  {'id': '2', 'image': 'assets/images/foam.png', 'name': 'Пенка для умывания', 'category': 'Уход', 'price': '490', 'isSale': 'false', 'oldPrice': ''},
  {'id': '3', 'image': 'assets/images/scrub.png', 'name': 'Скраб для лица', 'category': 'Уход', 'price': '380', 'isSale': 'false', 'oldPrice': ''},
  {'id': '4', 'image': 'assets/images/micellar.png', 'name': 'Мицеллярная вода', 'category': 'Уход', 'price': '490', 'isSale': 'true', 'oldPrice': '790'},
  {'id': '5', 'image': 'assets/images/botox_eye_cream.png', 'name': 'Ботокс-крем', 'category': 'Уход', 'price': '1030', 'isSale': 'false', 'oldPrice': ''},
  {'id': '6', 'image': 'assets/images/night_mask.png', 'name': 'Ночная маска', 'category': 'Уход', 'price': '450', 'isSale': 'true', 'oldPrice': '1750'},
  {'id': '7', 'image': 'assets/images/spf.png', 'name': 'Солнцезащитный крем', 'category': 'Уход', 'price': '675', 'isSale': 'false', 'oldPrice': ''},
  {'id': '8', 'image': 'assets/images/rose.png', 'name': 'Гидролат розы', 'category': 'Уход', 'price': '380', 'isSale': 'false', 'oldPrice': ''},
  {'id': '9', 'image': 'assets/images/cream_hand.png', 'name': 'Крем для рук', 'category': 'Уход', 'price': '320', 'isSale': 'false', 'oldPrice': ''},
  {'id': '10', 'image': 'assets/images/essence.png', 'name': 'Сыворотка гиалуроновая', 'category': 'Уход', 'price': '1450', 'isSale': 'true', 'oldPrice': '2350'},
  {'id': '11', 'image': 'assets/images/tonic.png', 'name': 'Тоник увлажняющий', 'category': 'Уход', 'price': '320', 'isSale': 'false', 'oldPrice': ''},
  {'id': '12', 'image': 'assets/images/alginate_mask.png', 'name': 'Маска альгинатная', 'category': 'Уход', 'price': '590', 'isSale': 'false', 'oldPrice': ''},
  {'id': '13', 'image': 'assets/images/eye_cream.png', 'name': 'Крем вокруг глаз', 'category': 'Уход', 'price': '490', 'isSale': 'false', 'oldPrice': ''},
  {'id': '14', 'image': 'assets/images/roller.png', 'name': 'Пилинг роллер', 'category': 'Уход', 'price': '350', 'isSale': 'false', 'oldPrice': ''},
  {'id': '15', 'image': 'assets/images/fluid.png', 'name': 'Флюид для лица', 'category': 'Уход', 'price': '720', 'isSale': 'false', 'oldPrice': ''},
  {'id': '16', 'image': 'assets/images/lip_balm.png', 'name': 'Бальзам для губ', 'category': 'Уход', 'price': '250', 'isSale': 'false', 'oldPrice': ''},
  {'id': '17', 'image': 'assets/images/termal_water.png', 'name': 'Термальная вода', 'category': 'Уход', 'price': '690', 'isSale': 'false', 'oldPrice': ''},
  {'id': '18', 'image': 'assets/images/body_cream.png', 'name': 'Крем для тела', 'category': 'Уход', 'price': '750', 'isSale': 'false', 'oldPrice': ''},

  // макияж
  {'id': '21', 'image': 'assets/images/foundation.png', 'name': 'Тональный крем', 'category': 'Макияж', 'price': '550', 'isSale': 'false', 'oldPrice': ''},
  {'id': '22', 'image': 'assets/images/lipstick.png', 'name': 'Помада матовая', 'category': 'Макияж', 'price': '1090', 'isSale': 'false', 'oldPrice': ''},
  {'id': '23', 'image': 'assets/images/mascara.png', 'name': 'Тушь для ресниц', 'category': 'Макияж', 'price': '450', 'isSale': 'false', 'oldPrice': ''},
  {'id': '24', 'image': 'assets/images/eyeshadow_palette.png', 'name': 'Палетка теней', 'category': 'Макияж', 'price': '1090', 'isSale': 'true', 'oldPrice': '2290'},
  {'id': '25', 'image': 'assets/images/concealer.png', 'name': 'Консилер', 'category': 'Макияж', 'price': '450', 'isSale': 'false', 'oldPrice': ''},
  {'id': '26', 'image': 'assets/images/highlighter.png', 'name': 'Хайлайтер', 'category': 'Макияж', 'price': '390', 'isSale': 'false', 'oldPrice': ''},
  {'id': '27', 'image': 'assets/images/blush.png', 'name': 'Румяна', 'category': 'Макияж', 'price': '420', 'isSale': 'false', 'oldPrice': ''},
  {'id': '28', 'image': 'assets/images/eyeliner_pencil.png', 'name': 'Карандаш для глаз', 'category': 'Макияж', 'price': '200', 'isSale': 'false', 'oldPrice': ''},
  {'id': '29', 'image': 'assets/images/liquid_eyeliner.png', 'name': 'Подводка для глаз', 'category': 'Макияж', 'price': '350', 'isSale': 'false', 'oldPrice': ''},
  {'id': '30', 'image': 'assets/images/lip_gloss.png', 'name': 'Блеск для губ', 'category': 'Макияж', 'price': '1090', 'isSale': 'true', 'oldPrice': '1590'},
  {'id': '31', 'image': 'assets/images/makeup_primer.png', 'name': 'База под макияж', 'category': 'Макияж', 'price': '1100', 'isSale': 'false', 'oldPrice': ''},
  {'id': '32', 'image': 'assets/images/setting_spray.png', 'name': 'Фиксатор макияжа', 'category': 'Макияж', 'price': '650', 'isSale': 'false', 'oldPrice': ''},
  {'id': '33', 'image': 'assets/images/color_corrector.png', 'name': 'Корректор', 'category': 'Макияж', 'price': '1080', 'isSale': 'false', 'oldPrice': ''},
  {'id': '34', 'image': 'assets/images/lipliner.png', 'name': 'Карандаш для губ', 'category': 'Макияж', 'price': '280', 'isSale': 'false', 'oldPrice': ''},
  {'id': '35', 'image': 'assets/images/lip_tint.png', 'name': 'Тинт для губ', 'category': 'Макияж', 'price': '490', 'isSale': 'false', 'oldPrice': ''},
  {'id': '36', 'image': 'assets/images/face_primer.png', 'name': 'Праймер', 'category': 'Макияж', 'price': '890', 'isSale': 'false', 'oldPrice': ''},
  {'id': '37', 'image': 'assets/images/finishing_spray.png', 'name': 'Сеттинг-спрей', 'category': 'Макияж', 'price': '670', 'isSale': 'false', 'oldPrice': ''},
  {'id': '38', 'image': 'assets/images/bb_cream.png', 'name': 'ВВ-крем', 'category': 'Макияж', 'price': '680', 'isSale': 'false', 'oldPrice': ''},
  {'id': '39', 'image': 'assets/images/camouflage_pencil.png', 'name': 'Маскирующий карандаш', 'category': 'Макияж', 'price': '520', 'isSale': 'false', 'oldPrice': ''},
  {'id': '40', 'image': 'assets/images/contour_palette.png', 'name': 'Палетка для контуринга', 'category': 'Макияж', 'price': '650', 'isSale': 'true', 'oldPrice': '1990'},

  // прочее
  {'id': '41', 'image': 'assets/images/brush_set.png', 'name': 'Набор кистей 12 шт', 'category': 'Прочее', 'price': '1290', 'isSale': 'false', 'oldPrice': ''},
  {'id': '42', 'image': 'assets/images/sponge.png', 'name': 'Спонжи для макияжа 2 шт', 'category': 'Прочее', 'price': '250', 'isSale': 'falzse', 'oldPrice': ''},
  {'id': '43', 'image': 'assets/images/mirror.png', 'name': 'Зеркало', 'category': 'Прочее', 'price': '450', 'isSale': 'false', 'oldPrice': ''},
  {'id': '44', 'image': 'assets/images/cosmetic_bag.png', 'name': 'Косметичка', 'category': 'Прочее', 'price': '1150', 'isSale': 'true', 'oldPrice': '1690'},
  {'id': '45', 'image': 'assets/images/nail_wipes.png', 'name': 'Салфетки для снятия лака', 'category': 'Прочее', 'price': '350', 'isSale': 'false', 'oldPrice': ''},
  {'id': '46', 'image': 'assets/images/sharpener.png', 'name': 'Точилка для карандашей', 'category': 'Прочее', 'price': '120', 'isSale': 'false', 'oldPrice': ''},
  {'id': '47', 'image': 'assets/images/tweezers.png', 'name': 'Щипчики для бровей', 'category': 'Прочее', 'price': '280', 'isSale': 'false', 'oldPrice': ''},
  {'id': '53', 'image': 'assets/images/pincet.png', 'name': 'Пинцет', 'category': 'Прочее', 'price': '190', 'isSale': 'false', 'oldPrice': ''},
  {'id': '49', 'image': 'assets/images/nail_scissors.png', 'name': 'Ножницы для ногтей', 'category': 'Прочее', 'price': '210', 'false': 'false', 'oldPrice': ''},
  {'id': '50', 'image': 'assets/images/applicator.png', 'name': 'Аппликаторы для теней', 'category': 'Прочее', 'price': '99', 'false': 'false', 'oldPrice': ''},
  {'id': '51', 'image': 'assets/images/fake_eyelashes.png', 'name': 'Ресницы накладные', 'category': 'Прочее', 'price': '350', 'isSale': 'false', 'oldPrice': ''},
  {'id': '52', 'image': 'assets/images/lash_glue.png', 'name': 'Клей для ресниц', 'category': 'Прочее', 'price': '380', 'isSale': 'false', 'oldPrice': ''},
  {'id': '58', 'image': 'assets/images/brush_pen.png', 'name': 'Пенал для кистей', 'category': 'Прочее', 'price': '320', 'isSale': 'false', 'oldPrice': ''},
  {'id': '54', 'image': 'assets/images/brush_holder.png', 'name': 'Подставка для кистей', 'category': 'Прочее', 'price': '290', 'isSale': 'false', 'oldPrice': ''},
  {'id': '55', 'image': 'assets/images/brow_tape.png', 'name': 'Лента для бровей', 'category': 'Прочее', 'price': '130', 'isSale': 'false', 'oldPrice': ''},
];

// Функция получения товаров по категории
List<Map<String, String>> getProductsByCategory(String categoryName) {
  return allProducts.where((product) => product['category'] == categoryName).toList();
}

// Фиксированный список популярных товаров
List<String> popularIds = ['50', '21', '6', '10', '4', '24', '30', '40'];

// Функция получения популярных товаров
List<Map<String, String>> getPopularProducts() {
  return allProducts.where((product) => popularIds.contains(product['id'])).toList();
}

// Функция получения товаров со скидкой (для акций)
List<Map<String, String>> getSaleProducts() {
  return allProducts.where((product) => product['isSale'] == 'true').toList();
}

// Функция получения товара по id
Map<String, String>? getProductById(String id) {
  try {
    return allProducts.firstWhere((product) => product['id'] == id);
  } catch (e) {
    return null;
  }
}

// Список товаров в корзине (храним id и количество)
Map<String, int> cartItems = {};

// Добавить товар в корзину
void addToCart(String id) {
  if (cartItems.containsKey(id)) {
    cartItems[id] = cartItems[id]! + 1;
  } else {
    cartItems[id] = 1;
  }
}

// Удалить товар из корзины
void removeFromCart(String id) {
  if (cartItems.containsKey(id)) {
    cartItems[id] = cartItems[id]! - 1;
    if (cartItems[id] == 0) {
      cartItems.remove(id);
    }
  }
}

// Получить количество товара в корзине
int getCartQuantity(String id) {
  return cartItems[id] ?? 0;
}

// Проверить, есть ли товар в корзине
bool isInCart(String id) {
  return cartItems.containsKey(id);
}

// Получить общую сумму корзины
int getTotalPrice() {
  int total = 0;
  cartItems.forEach((id, quantity) {
    final product = getProductById(id);
    if (product != null) {
      total += int.parse(product['price']!) * quantity;
    }
  });
  return total;
}

// Сохранение данных пользователя
Future<void> saveAuth() async {
  await prefs.setString('name', nameController.text);
  await prefs.setString('email', emailController.text);
  await prefs.setString('password', passwordController.text);
}

// Выход из профиля
void logout(BuildContext context) {
  navToSignIn(context);
}

// Валидация email
void validEmail() {
  if (emailController.text.isEmpty) {
    emailError = 'Введите почту';
  } else if (!emailController.text.contains('@')) {
    emailError = 'Введите корректную почту';
  } else {
    emailError = null;
  }
}

// Валидация имени
void validName() {
  if (nameController.text.isEmpty) {
    nameError = 'Введите имя';
  } else {
    nameError = null;
  }
}

// Валидация пароля
void validPassword() {
  if (passwordController.text.isEmpty) {
    passwordError = 'Введите пароль';
  } else if (passwordController.text.length < 6) {
    passwordError = 'Пароль должен быть не менее 6 символов';
  } else {
    passwordError = null;
  }
}