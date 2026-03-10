import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glamme/presentation/uikit/colors.dart';
import 'package:google_fonts/google_fonts.dart';

// Тип текстового поля
enum TextFieldType { text, password }

// Текстовое поле
class CustomTextField extends StatefulWidget {
  final TextFieldType type; // Тип поля
  final TextEditingController controller; // Контроллер
  final double borderRadius; // Закругление поля
  final Color colorCursor; // Цвет курсора
  final Color colorBorder; // Цвет границ
  final Color colorFocus; // Цвет границ при фокусе
  final Color colorError; // Цвет границ при ошибке
  final String title; // Заголовок
  final String hintText; // Текст-подсказка
  final String? errorText; // Текст ошибки

  const CustomTextField({
    super.key,
    required this.type,
    required this.controller,
    required this.borderRadius,
    required this.colorCursor,
    required this.colorBorder,
    required this.colorFocus,
    required this.colorError,
    required this.title,
    required this.hintText,
    this.errorText,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    bool hasError = widget.errorText != null;

    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.title,
              style: GoogleFonts.sulphurPoint(fontSize: 17, color: gray),
            ),
            Spacer(),
          ],
        ),
        SizedBox(height: 10),
        TextField(
          cursorColor: widget.colorCursor,
          controller: widget.controller,
          obscureText: widget.type == TextFieldType.password
              ? obscureText
              : false,
          decoration: InputDecoration(
            suffixIcon: widget.type == TextFieldType.password
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(
                        obscureText
                            ? 'assets/icons/eye-off.svg'
                            : 'assets/icons/eye-on.svg',
                      ),
                    ),
                  )
                : null,
            hintText: widget.hintText,
            hintStyle: GoogleFonts.sulphurPoint(fontSize: 14, color: hintText),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(widget.borderRadius),
              ),
              borderSide: BorderSide(
                color: hasError ? widget.colorError : widget.colorBorder,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(widget.borderRadius),
              ),
              borderSide: BorderSide(
                color: hasError ? widget.colorError : widget.colorFocus,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(widget.borderRadius),
              ),
              borderSide: BorderSide(
                color: hasError ? widget.colorError : widget.colorBorder,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        if (hasError)
          Row(
            children: [
              Text(
                widget.errorText!,
                style: GoogleFonts.sulphurPoint(fontSize: 14, color: error),
              ),
              Spacer(),
            ],
          ),
      ],
    );
  }
}
