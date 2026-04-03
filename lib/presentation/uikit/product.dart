import 'package:flutter/material.dart';
import 'package:glamme/presentation/mainScreens/sections/product_description.dart';
import 'package:glamme/presentation/mainScreens/sections/profile.dart';
import 'package:glamme/presentation/uikit/colors.dart';
import 'package:google_fonts/google_fonts.dart';


//
class Product extends StatefulWidget {
  final String image;
  final String name;
  final String category;
  final String price;

  const Product({super.key, required this.image, required this.name, required this.category, required this.price});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: white,
        boxShadow: [BoxShadow(color: gray.withOpacity(0.1), offset: Offset(0, 0), spreadRadius: 0, blurRadius: 1)],
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width * 0.75,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductPage()));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Center(
                    child: Image.asset(
                     widget.image,
                      height: 200,
                      width: 350,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: GestureDetector(
                      onTap: () {},
                      child: Image.asset('assets/images/favorite.png', width: 20),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: GoogleFonts.sulphurPoint(fontSize: 16, fontWeight: FontWeight.bold, color: title),
                ),
                Text(
                  widget.category,
                  style: GoogleFonts.sulphurPoint(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xffAA9E9E)),
                ),
                Text(
                  widget.price + 'р',
                  style: GoogleFonts.sulphurPoint(fontSize: 18, fontWeight: FontWeight.w600, color: title),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
