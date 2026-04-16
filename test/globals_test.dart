import 'package:flutter_test/flutter_test.dart';
import 'package:glamme/domain/globals.dart';

void main() {
  setUp(() {
    cartItems.clear();
    favoriteIds.clear();
    emailController.clear();
    passwordController.clear();
    nameController.clear();
    emailError = null;
    passwordError = null;
    nameError = null;
  });

  group('Корзина', () {
    test('addToCart() - добавляет новый товар', () {
      addToCart('1');
      expect(cartItems['1'], 1);
    });

    test('addToCart() - увеличивает количество', () {
      addToCart('1');
      addToCart('1');
      expect(cartItems['1'], 2);
    });

    test('removeFromCart() - уменьшает количество', () {
      addToCart('1');
      addToCart('1');
      removeFromCart('1');
      expect(cartItems['1'], 1);
    });

    test('removeFromCart() - удаляет при 0', () {
      addToCart('1');
      removeFromCart('1');
      expect(cartItems.containsKey('1'), false);
    });

    test('getTotalPrice() - считает сумму', () {
      addToCart('1');
      addToCart('1');
      expect(getTotalPrice(), 2000);
    });

    test('getTotalPrice() - пустая корзина = 0', () {
      expect(getTotalPrice(), 0);
    });
  });

  group('Избранное', () {
    test('toggleFavorite() - добавляет', () {
      toggleFavorite('1');
      expect(isFavorite('1'), true);
    });

    test('toggleFavorite() - удаляет', () {
      toggleFavorite('1');
      toggleFavorite('1');
      expect(isFavorite('1'), false);
    });
  });

  group('Валидация', () {
    test('validEmail() - корректный email', () {
      emailController.text = 'test@mail.ru';
      validEmail();
      expect(emailError, null);
    });

    test('validEmail() - пустой email', () {
      emailController.text = '';
      validEmail();
      expect(emailError, 'Введите почту');
    });

    test('validPassword() - корректный пароль', () {
      passwordController.text = '123456';
      validPassword();
      expect(passwordError, null);
    });

    test('validPassword() - короткий пароль', () {
      passwordController.text = '123';
      validPassword();
      expect(passwordError, 'Пароль должен быть не менее 6 символов');
    });
  });
}