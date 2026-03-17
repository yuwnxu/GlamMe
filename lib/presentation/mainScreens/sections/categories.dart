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

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: categoryList.length, vsync: this);
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
                        'Категории',
                        style: GoogleFonts.sulphurPoint(fontSize: 18, fontWeight: FontWeight.bold, color: title),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            SizedBox(
              height: 30,
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
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border(bottom: isSelected ? BorderSide(color: black) : BorderSide.none),
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
            SizedBox(height: 30),
            Expanded(
              child: PageView(
                controller: categoryController,
                onPageChanged: (index) {
                  setState(() {
                    selectedCategories = index;
                  });
                },
                children: [
                  GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1, crossAxisSpacing: 12, mainAxisSpacing: 12),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Product(image: 'assets/images/cream.png', name: 'Крем для лица', category: 'Уход', price: '1000');
                    },
                  ),
                  GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1, crossAxisSpacing: 12, mainAxisSpacing: 12),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Product(image: 'assets/images/cream.png', name: 'Крем для лица', category: 'Уход', price: '1000');
                    },
                  ),
                  GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1, crossAxisSpacing: 12, mainAxisSpacing: 12),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Product(image: 'assets/images/cream.png', name: 'Крем для лица', category: 'Уход', price: '1000');
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
