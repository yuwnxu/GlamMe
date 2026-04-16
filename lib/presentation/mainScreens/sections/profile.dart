import 'package:flutter/material.dart';
import 'package:glamme/domain/globals.dart';
import 'package:glamme/presentation/uikit/colors.dart';
import 'package:glamme/presentation/uikit/custom_button.dart';
import 'package:glamme/presentation/uikit/custom_textfield.dart';
import 'package:google_fonts/google_fonts.dart';

// Экран Profile
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    emailController.addListener(updateWidget);
    passwordController.addListener(updateWidget);
    nameController.addListener(updateWidget);

    // Загружаем сохраненные данные
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadUserData();
    });
  }

  void _loadUserData() {
    final savedName = prefs.getString('name') ?? '';
    final savedEmail = prefs.getString('email') ?? '';
    final savedPassword = prefs.getString('password') ?? '';

    if (nameController.text.isEmpty && savedName.isNotEmpty) {
      nameController.text = savedName;
    }
    if (emailController.text.isEmpty && savedEmail.isNotEmpty) {
      emailController.text = savedEmail;
    }
    if (passwordController.text.isEmpty && savedPassword.isNotEmpty) {
      passwordController.text = savedPassword;
    }
  }

  void updateWidget() => setState(() {});

  @override
  void dispose() {
    emailController.removeListener(updateWidget);
    passwordController.removeListener(updateWidget);
    nameController.removeListener(updateWidget);
    super.dispose();
  }

  void valid() {
    setState(() {
      validEmail();
      validName();
      validPassword();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
              // Заголовок
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Профиль',
                  style: GoogleFonts.sulphurPoint(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: title,
                  ),
                ),
              ),
              SizedBox(height: 30),
              // Аватар
              Center(
                child: Image.asset(
                  'assets/images/user_icon.png',
                  width: 100,
                  height: 100,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.person, size: 50, color: Colors.grey),
                    );
                  },
                ),
              ),
              SizedBox(height: 30),
              // Поля ввода
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    CustomTextField(
                      type: TextFieldType.text,
                      controller: nameController,
                      colorBorder: border,
                      colorFocus: black,
                      colorError: error,
                      title: 'Имя',
                      hintText: 'name',
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
              // Кнопка "Изменить"
              CustomButton(
                textButton: 'ИЗМЕНИТЬ',
                colorButton: black,
                widthButton: 292,
                heightButton: 47,
                borderRadius: 20,
                onButton: () async {
                  valid(); // Валидация полей

                  if (emailError != null || passwordError != null || nameError != null) {
                    if (mounted) {
                      setState(() {});
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Исправьте ошибки в форме'),
                          backgroundColor: error,
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  } else {
                    await saveAuth();

                    if (mounted) {
                      setState(() {});
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Данные обновлены! ✨'),
                          backgroundColor: success,
                          duration: Duration(seconds: 2),
                        ),
                      );
                      clearErrors();
                    }
                  }
                },
              ),
              SizedBox(height: 50),
              // Кнопка "Выйти"
              Center(
                child: GestureDetector(
                  onTap: () {
                    logout(context);
                  },
                  child: Text(
                    'Выйти из профиля',
                    style: GoogleFonts.sulphurPoint(
                      fontSize: 16,
                      color: error,
                    ),
                  ),
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