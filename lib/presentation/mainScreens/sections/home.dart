import 'package:flutter/material.dart';
import 'package:glamme/data/data.dart';
import 'package:glamme/domain/globals.dart';
import 'package:glamme/presentation/uikit/colors.dart';
import 'package:glamme/presentation/uikit/product.dart';
import 'package:glamme/presentation/uikit/productCard.dart';
import 'package:google_fonts/google_fonts.dart';

// Экран Home
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //
  @override
  void initState() {
    super.initState();
    loadCategories();
  }

  //
  void loadCategories() async {
    // postCategories();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/user_icon.png', width: 50),
                      SizedBox(width: 20),
                      Text(
                        'Здравствуй, Юлдуз!',
                        style: GoogleFonts.sulphurPoint(fontSize: 20, fontWeight: FontWeight.bold, color: title),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        'Категории',
                        style: GoogleFonts.sulphurPoint(fontSize: 18, fontWeight: FontWeight.bold, color: title),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          navToCategories(context);
                        },
                        child: Icon(Icons.arrow_forward_ios, size: 18),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            SizedBox(
              height: 35,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: categoryList.length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedCategories == index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategories = index;
                      });
                      animateToCategory();
                      // loadProducts();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border(bottom: isSelected ? BorderSide(color: black, width: 1) : BorderSide.none),
                      ),
                      child: Text(
                        categoryList[index]['name'],
                        style: GoogleFonts.sulphurPoint(fontSize: 16, fontWeight: FontWeight.bold, color: isSelected ? black : unSelectedCategory),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 300,
              child: PageView(
                controller: categoryController,
                onPageChanged: (index) {
                },
                children: [
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return Product(image: 'assets/images/cream.png', name: 'Крем для лица', category: 'Уход', price: '1000');
                    },
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                  ),
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return Product(image: 'assets/images/cream.png', name: 'Крем для лица', category: 'Уход', price: '1000');
                    },
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                  ),
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return Product(image: 'assets/images/cream.png', name: 'Крем для лица', category: 'Уход', price: '1000');
                    },
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text(
                    'Популярное',
                    style: GoogleFonts.sulphurPoint(fontSize: 18, fontWeight: FontWeight.bold, color: title),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ProductCard(image: 'assets/images/cream.png', name: 'Крем для лица', category: 'Уход', price: '10.000р');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
