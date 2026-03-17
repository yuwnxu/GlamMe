import 'package:flutter/material.dart';
import 'package:glamme/presentation/uikit/colors.dart';
import 'package:google_fonts/google_fonts.dart';

//
class ProductCard extends StatefulWidget {
  final String image;
  final String name;
  final String category;
  final String price;

  const ProductCard({super.key, required this.image, required this.name, required this.category, required this.price});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          Image.asset(widget.image, fit: BoxFit.contain),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: GoogleFonts.sulphurPoint(fontSize: 16, fontWeight: FontWeight.bold, color: title),
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
        ],
      ),
    );
  }
}
