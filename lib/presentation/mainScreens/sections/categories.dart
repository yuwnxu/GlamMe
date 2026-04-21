import 'package:flutter/material.dart';
import 'package:glamme/domain/globals.dart';
import 'package:glamme/presentation/uikit/colors.dart';
import 'package:glamme/presentation/uikit/product.dart';
import 'package:google_fonts/google_fonts.dart';

// Экран Categories
class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> with TickerProviderStateMixin {
  late TabController tabController;

  List<Map<String, dynamic>> categories = [
    {'name': 'Акции'},
    {'name': 'Макияж'},
    {'name': 'Уход'},
    {'name': 'Прочее'},
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: categories.length, vsync: this);
    tabController.addListener(() {
      setState(() {
        selectedCategories = tabController.index;
      });
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      navToHome(context);
                    },
                    child: Icon(Icons.arrow_back_ios, size: 18),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        'Каталог',
                        style: GoogleFonts.sulphurPoint(fontSize: 20, fontWeight: FontWeight.bold, color: title),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40,),
            SizedBox(
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedCategories == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategories = index;
                      });
                      animateToCategory();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border(bottom: isSelected ? BorderSide(color: black, width: 2) : BorderSide.none),
                      ),
                      child: Text(
                        categories[index]['name'],
                        style: GoogleFonts.sulphurPoint(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? black : unSelectedCategory,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: PageView(
                controller: categoryController,
                onPageChanged: (index) {
                  setState(() {
                    selectedCategories = index;
                  });
                },
                children: [
                  // Акции
                  GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: getSaleProducts().length,
                    itemBuilder: (context, index) {
                      final product = getSaleProducts()[index];
                      return Product(
                        id: product['id']!,
                        image: product['image']!,
                        name: product['name']!,
                        category: product['category']!,
                        price: product['price']!,
                        oldPrice: product['oldPrice'] ?? '',
                      );
                    },
                  ),
                  // Макияж
                  GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: getProductsByCategory('Макияж').length,
                    itemBuilder: (context, index) {
                      final product = getProductsByCategory('Макияж')[index];
                      return Product(
                        id: product['id']!,
                        image: product['image']!,
                        name: product['name']!,
                        category: product['category']!,
                        price: product['price']!,
                      );
                    },
                  ),
                  // Уход
                  GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: getProductsByCategory('Уход').length,
                    itemBuilder: (context, index) {
                      final product = getProductsByCategory('Уход')[index];
                      return Product(
                        id: product['id']!,
                        image: product['image']!,
                        name: product['name']!,
                        category: product['category']!,
                        price: product['price']!,
                      );
                    },
                  ),
                  // Прочее
                  GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: getProductsByCategory('Прочее').length,
                    itemBuilder: (context, index) {
                      final product = getProductsByCategory('Прочее')[index];
                      return Product(
                        id: product['id']!,
                        image: product['image']!,
                        name: product['name']!,
                        category: product['category']!,
                        price: product['price']!,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}