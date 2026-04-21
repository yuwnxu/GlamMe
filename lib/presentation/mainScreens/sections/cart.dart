import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glamme/domain/globals.dart';
import 'package:glamme/presentation/mainScreens/sections/product_description.dart';
import 'package:glamme/presentation/uikit/colors.dart';
import 'package:glamme/presentation/uikit/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';

// Экран Корзина
class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Корзина',
                style: GoogleFonts.sulphurPoint(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: title,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: cartItems.isEmpty
                  ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/heart-not-filled.svg',
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Корзина пуста',
                      style: GoogleFonts.sulphurPoint(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              )
                  : ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final productId = cartItems.keys.elementAt(index);
                  final product = getProductById(productId);
                  final quantity = cartItems[productId]!;

                  if (product == null) return const SizedBox.shrink();

                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(
                        MaterialPageRoute(
                          builder: (context) => ProductPage(
                            id: product['id']!,
                            image: product['image']!,
                            name: product['name']!,
                            category: product['category']!,
                            price: product['price']!,
                          ),
                        ),
                      )
                          .then((_) {
                        setState(() {});
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 150,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: gray.withOpacity(0.1),
                              spreadRadius: 0,
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                product['image']!,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    product['name']!,
                                    style: GoogleFonts.sulphurPoint(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: title,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    product['category']!,
                                    style: GoogleFonts.sulphurPoint(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xffAA9E9E),
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '${product['price']}р',
                                    style: GoogleFonts.sulphurPoint(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: title,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Счетчик количества
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        removeFromCart(productId);
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                      child: const Text(
                                        '-',
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(color: Colors.grey.shade300),
                                        right: BorderSide(color: Colors.grey.shade300),
                                      ),
                                    ),
                                    child: Text(
                                      '$quantity',
                                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        addToCart(productId);
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                      child: const Text(
                                        '+',
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // итог
            if (cartItems.isNotEmpty) ...[
              const Divider(thickness: 1, height: 1),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Итого:',
                          style: GoogleFonts.sulphurPoint(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: title,
                          ),
                        ),
                        Text(
                          '${getTotalPrice()}р',
                          style: GoogleFonts.sulphurPoint(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: title,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    CustomButton(
                      textButton: 'ЗАКАЗАТЬ',
                      colorButton: black,
                      widthButton: double.infinity,
                      heightButton: 56,
                      borderRadius: 20,
                      onButton: () {
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            backgroundColor: Colors.transparent,
                            child: Container(
                              width: 270,
                              height: 190,
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(height: 20),
                                  Text(
                                    'Заказ успешно\nоформлен!',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.sulphurPoint(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: title,
                                    ),
                                  ),
                                  CustomButton(
                                    textButton: 'НА ГЛАВНУЮ',
                                    colorButton: black,
                                    widthButton: 175,
                                    heightButton: 45,
                                    borderRadius: 20,
                                    onButton: () {
                                      setState(() {
                                        cartItems.clear();
                                      });
                                      navToHome(context);
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}