import 'package:flutter/material.dart';
import 'package:glamme/presentation/uikit/colors.dart';
import 'package:google_fonts/google_fonts.dart';

// Экран Home
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(child:
      Column(
        children: [
          SizedBox(height: 40,),
          Center(
            child: Text('Главная', style: GoogleFonts.sulphurPoint(fontSize: 20, fontWeight: FontWeight.bold, color: title),),
          ),
          SizedBox(height: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Акции',
                    style: GoogleFonts.sulphurPoint(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: title,
                    ),
                  ),
                  Container(
                    height: 2,
                    width: 80,
                    color: title,
                  ),
                ],
              ),
              Text(
                'Макияж',
                style: GoogleFonts.sulphurPoint(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffAA9E9E),
                ),
              ),
              Text(
                'Уход',
                style: GoogleFonts.sulphurPoint(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffAA9E9E),
                ),
              ),
              Text(
                'Прочее',
                style: GoogleFonts.sulphurPoint(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffAA9E9E),
                ),
              ),
            ],
          ),
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.only(right: 70),
            child: Container(
              width: 300,
              height: 300,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/cream.png', height: 200, width: 200,),
                  SizedBox(height: 10,),
                  Text('Крем для лица', style: GoogleFonts.sulphurPoint(fontSize: 16, fontWeight: FontWeight.bold, color: title)),
                  Text('Уход', style: GoogleFonts.sulphurPoint(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xffAA9E9E))),
                  Text('10.000р', style: GoogleFonts.sulphurPoint(fontSize: 14, fontWeight: FontWeight.w600, color: title)),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
