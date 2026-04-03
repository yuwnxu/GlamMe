import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glamme/domain/globals.dart';
import 'package:glamme/presentation/mainScreens/sections/product_description.dart';
import 'package:glamme/presentation/uikit/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatefulWidget {
  final String id;
  final String image;
  final String name;
  final String category;
  final String price;

  const ProductCard({
    super.key,
    required this.id,
    required this.image,
    required this.name,
    required this.category,
    required this.price
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductPage(
              id: widget.id,
              image: widget.image,
              name: widget.name,
              category: widget.category,
              price: widget.price,
            )
        ));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: white,
          boxShadow: [BoxShadow(color: gray.withOpacity(0.1), offset: Offset(0, 0), spreadRadius: 0, blurRadius: 1)],
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(widget.image, fit: BoxFit.contain, width: 80),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.name,
                          style: GoogleFonts.sulphurPoint(fontSize: 16, fontWeight: FontWeight.bold, color: title),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            toggleFavorite(widget.id);
                          });
                        },
                        child: SvgPicture.asset(
                          isFavorite(widget.id)
                              ? 'assets/icons/heart-filled.svg'
                              : 'assets/icons/heart-not-filled.svg',
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      widget.category,
                      style: GoogleFonts.sulphurPoint(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xffAA9E9E)),
                    ),
                  ),
                  Text(
                    widget.price,
                    style: GoogleFonts.sulphurPoint(fontSize: 18, fontWeight: FontWeight.w600, color: title),
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