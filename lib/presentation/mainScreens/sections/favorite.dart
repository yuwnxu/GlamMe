import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glamme/domain/globals.dart';
import 'package:glamme/presentation/mainScreens/sections/product_description.dart';
import 'package:glamme/presentation/uikit/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
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
                'Избранное',
                style: GoogleFonts.sulphurPoint(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: title,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: favoriteIds.isEmpty
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
                      'Нет избранных товаров',
                      style: GoogleFonts.sulphurPoint(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              )
                  : ListView.builder(
                itemCount: favoriteIds.length,
                itemBuilder: (context, index) {
                  final product = getProductById(favoriteIds[index]);

                  if (product == null) return const SizedBox.shrink();

                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductPage(
                            id: product['id']!,
                            image: product['image']!,
                            name: product['name']!,
                            category: product['category']!,
                            price: product['price']!,
                          ),
                        ),
                      ).then((_) {
                        setState(() {});
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Container(
                        height: 130,
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
                            SizedBox(width: 15),
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
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  toggleFavorite(product['id']!);
                                });
                              },
                              child: SvgPicture.asset(
                                'assets/icons/heart-filled.svg',
                                width: 20,
                                height: 20,
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
          ],
        ),
      ),
    );
  }
}