import 'package:flutter/material.dart';
import 'package:glamme/presentation/uikit/colors.dart';
import 'package:google_fonts/google_fonts.dart';

// Кнопка
class CustomButton extends StatelessWidget {
  final String textButton; // Текст кнопки
  final Color colorButton; // Цвет кнопки
  final double widthButton; // Ширина кнопки
  final double heightButton; // Высота кнопки
  final double borderRadius; // Закругление кнопки
  final VoidCallback onButton; // Действие при нажатии на кнопку

  const CustomButton({
    super.key,
    required this.textButton,
    required this.colorButton,
    required this.widthButton,
    required this.heightButton,
    required this.borderRadius,
    required this.onButton,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onButton,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(widthButton, heightButton),
        backgroundColor: colorButton,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
      ),
      child: Text(
        textButton,
        style: GoogleFonts.sulphurPoint(fontSize: 19, color: white),
      ),
    );
  }
}
