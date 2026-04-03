import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glamme/domain/globals.dart';
import 'package:glamme/presentation/uikit/colors.dart';
import 'package:glamme/presentation/uikit/product.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../uikit/custom_button.dart';

class ProductPage extends StatefulWidget {
  final String id;
  final String image;
  final String name;
  final String category;
  final String price;

  const ProductPage({
    super.key,
    required this.id,
    required this.image,
    required this.name,
    required this.category,
    required this.price,
  });

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios, size: 18),
                  ),
                  Spacer(),
                ],
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Container(
                height: 480,
                width: MediaQuery.of(context).size.width,
                child: Product(
                  id: widget.id,
                  image: widget.image,
                  name: widget.name,
                  category: widget.category,
                  price: widget.price,
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Описание',
                      style: GoogleFonts.sulphurPoint(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: title)),
                  SizedBox(height: 10),
                  Text(
                    'Крем с гиалуроновой кислотой обеспечивает глубокое увлажнение на длительное время. Комплекс активных компонентов помогает разглаживать поверхность кожи, защищает от трансэпидермальной потери влаги, стимулирует синтез коллагена и эластина, тем самым предотвращая преждевременное старение.',
                    style: GoogleFonts.sulphurPoint(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff2D2D2D)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            isInCart(widget.id)
                ? ElevatedButton(
              onPressed: () {
                navToCart(context);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(352, 56),
                backgroundColor: white,
                elevation: 0,
                side: BorderSide(color: black, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              child: Text(
                'ДОБАВЛЕНО',
                style: GoogleFonts.sulphurPoint(fontSize: 12, color: black, fontWeight: FontWeight.w600),
              ),
            )
                : CustomButton(
              textButton: 'В КОРЗИНУ',
              colorButton: black,
              widthButton: 352,
              heightButton: 56,
              borderRadius: 20,
              onButton: () {
                setState(() {
                  addToCart(widget.id);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}