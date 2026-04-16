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
  final nameUser = prefs.getString('name') ?? 'Пользователь';

  List<Map<String, dynamic>> categories = [
    {'name': 'Акции'},
    {'name': 'Макияж'},
    {'name': 'Уход'},
    {'name': 'Прочее'},
  ];

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/user_icon.png',
                          width: 50,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.person, size: 30, color: Colors.grey),
                            );
                          },
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            'Здравствуй, $nameUser!',
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.sulphurPoint(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: title,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          'Каталог',
                          style: GoogleFonts.sulphurPoint(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: title,
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            navToCategories(context);
                            selectedCategories = 0;
                          },
                          child: Icon(Icons.arrow_forward_ios, size: 18),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),

              // список категорий
              SizedBox(
                height: 40,
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
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: isSelected
                                ? BorderSide(color: black, width: 2)
                                : BorderSide.none,
                          ),
                        ),
                        child: Text(
                          categories[index]['name'],
                          style: GoogleFonts.sulphurPoint(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: isSelected ? black : unSelectedCategory,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 10),

              SizedBox(
                height: 300,
                child: PageView(
                  controller: categoryController,
                  onPageChanged: (index) {
                    setState(() {
                      selectedCategories = index;
                    });
                  },
                  children: List.generate(categories.length, (index) {
                    return ListView.builder(
                      itemBuilder: (context, productIndex) {
                        return Product(
                          id: '1',
                          image: 'assets/images/cream.png',
                          name: 'Крем для лица',
                          category: categories[index]['name'],
                          price: '1000',
                        );
                      },
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                    );
                  }),
                ),
              ),

              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text(
                      'Популярное',
                      style: GoogleFonts.sulphurPoint(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: title,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      id: '1',
                      image: 'assets/images/cream.png',
                      name: 'Крем для лица',
                      category: 'Уход',
                      price: '10.000р',
                    );
                  },
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}