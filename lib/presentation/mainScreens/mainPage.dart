import 'package:flutter/material.dart';
import 'package:glamme/domain/globals.dart';
import 'package:glamme/presentation/uikit/colors.dart';

// Экран MainPage
class MainPage extends StatefulWidget {
  final int selectedIndex;

  const MainPage({super.key, this.selectedIndex = 0});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(child: selectPage(currentIndex)),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          backgroundColor: background,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          currentIndex: currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          enableFeedback: false,
          selectedItemColor: Colors.transparent,
          unselectedItemColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          items: List.generate(
            icons.length,
                (index) => BottomNavigationBarItem(
              label: '',
              icon: Padding(
                padding: const EdgeInsets.only(top: 14),
                child: Image.asset(
                  width: 20,
                  height: 20,
                  currentIndex == index ? selectedIcons[index] : icons[index],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
