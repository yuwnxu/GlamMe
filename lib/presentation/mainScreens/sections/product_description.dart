import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glamme/presentation/uikit/colors.dart';
import 'package:glamme/presentation/uikit/product.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../uikit/custom_button.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios, size: 18),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset('assets/images/favorite.png', width: 20),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Container(
                height: 450,
                width: MediaQuery.of(context).size.width ,// фиксированная высота для продукта
                child: Product(
                  image: 'assets/images/cream.png',
                  name: 'Крем для лица',
                  category: 'Уход',
                  price: '1000',
                ),
              ),
              SizedBox(height: 20,),
                Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Описание', style: GoogleFonts.sulphurPoint(fontSize: 16, fontWeight: FontWeight.bold, color: title),),
                  SizedBox(height: 10,),
                  Text('Крем с гиалуроновой кислотой обеспечивает глубокое\nувлажнение на длительное время.\nКомплекс активных компонентов помогает\nразглаживать поверхность кожи, защищает от\nтрансэпидермальной потери влаги, стимулирует\nсинтез коллагена и эластина, тем самым\nпредотвращая преждевременное старение.', style: GoogleFonts.sulphurPoint(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xff2D2D2D)),),
                ],
              ),
              SizedBox(height: 30),
              CustomButton(
                textButton: 'В КОРЗИНУ',
                colorButton: black,
                widthButton: 352,
                heightButton: 56,
                borderRadius: 20,
                onButton: () {
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}