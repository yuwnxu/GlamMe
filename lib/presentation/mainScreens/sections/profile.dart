import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glamme/presentation/uikit/colors.dart';
import 'package:glamme/presentation/uikit/custom_textfield.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../domain/globals.dart';
import '../../uikit/custom_button.dart';

// Экран Profile
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  void initState() {
    super.initState();
    emailController.addListener(updateWidget);
    passwordController.addListener(updateWidget);
    nameController.addListener(updateWidget);
  }

  void updateWidget() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    emailController.removeListener(updateWidget);
    passwordController.removeListener(updateWidget);
    nameController.removeListener(updateWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(child:
      Column(
        children: [
          Padding(
            padding: EdgeInsets.all(30),
            child: Row(
              children: [
                GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset('assets/icons/arrow.svg')),
                Spacer(),
                Text('Профиль', style: GoogleFonts.sulphurPoint(fontSize: 20, fontWeight: FontWeight.bold, color: title),),
                Spacer(),
              ],
            ),
          ),
          SizedBox(height: 50,),
          Center(child: Image.asset('assets/images/user_icon.png')),
          SizedBox(height: 45,),
          Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                CustomTextField(
                  type: TextFieldType.text,
                  controller: nameController,
                  colorBorder: border,
                  colorFocus: black,
                  colorError: error,
                  title: 'Имя',
                  hintText: '',
                  errorText: nameError,
                  borderRadius: 15,
                  colorCursor: black,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  type: TextFieldType.text,
                  controller: emailController,
                  colorBorder: border,
                  colorFocus: black,
                  colorError: error,
                  title: 'Почта',
                  hintText: 'name@mail.com',
                  errorText: emailError,
                  borderRadius: 15,
                  colorCursor: black,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  type: TextFieldType.password,
                  controller: passwordController,
                  colorBorder: border,
                  colorFocus: black,
                  colorError: error,
                  title: 'Пароль',
                  hintText: '**********',
                  errorText: passwordError,
                  borderRadius: 15,
                  colorCursor: black,
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          CustomButton(
            textButton: 'Изменить',
            colorButton: black,
            widthButton: 352,
            heightButton: 56,
            borderRadius: 20,
            onButton: () {
              if (emailError == null ||
                  passwordError == null ||
                  nameError == null) {
                navToProfile(context);
              } else {
                if (mounted) {
                  setState(() {});
                }
              }
            },
          ),
        ],
      )),
    );
  }
}
