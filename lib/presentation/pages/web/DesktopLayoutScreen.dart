import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_document/core/utils/app_colors.dart';
import 'package:my_document/presentation/pages/web/navigations/DesktopHomeScreen.dart';
import 'navigations/DesktopDocumentScreen.dart';

class DesktopLayoutScreen extends StatefulWidget {
  DesktopLayoutScreen({Key? key}) : super(key: key);

  @override
  _DesktopLayoutScreenState createState() => _DesktopLayoutScreenState();
}

class _DesktopLayoutScreenState extends State<DesktopLayoutScreen> {
  late Widget _currentScreen;

  @override
  void initState() {
    super.initState();
    _currentScreen = const DesktopHomeScreen();
  }

  void _updateScreen(Widget newScreen) {
    setState(() {
      _currentScreen = newScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Row(
        children: [
          SideBar(
            width: width * 0.15,
            updateScreen: _updateScreen,
          ),
          SizedBox(
            width: width * 0.85,
            height: height,
            child: _currentScreen,
          ),
        ],
      ),
    );
  }
}

class SideBar extends StatefulWidget {
  SideBar({required this.width, required this.updateScreen});

  final double width;
  final Function(Widget) updateScreen;

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> tabs = [
    {
      "name": "Home",
      "icon": "assets/home.png",
      "isSelected": true,
      "route": DesktopHomeScreen(),
    },
    {
      "name": "Documents",
      "icon": "assets/document.png",
      "isSelected": false,
      "route": DesktopDocumentScreen(),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide.none,
          vertical: BorderSide(width: 0.5, color: AppColors.underlineColor),
        ),
      ),
      child: Column(
        children: [
          Image.asset(
            'assets/logo.png',
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          const Divider(),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: tabs.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  print("Tapped: ${tabs[index]["name"]}");
                  setState(() {
                    _selectedIndex = index;
                  });
                  widget.updateScreen(tabs[index]["route"] as Widget);
                },
                child: ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  leading: Image.asset(
                    tabs[index]["icon"],
                    color: _selectedIndex == index
                        ? AppColors.primaryColor
                        : AppColors.blackColor,
                  ),
                  title: buildTextWidget(tabs[index]["name"],
                      isSelected: _selectedIndex == index),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextWidget(String text, {bool isSelected = false}) {
    return Text(
      text,
      style: GoogleFonts.roboto(
        fontWeight: FontWeight.w400,
        color: isSelected ? AppColors.primaryColor : AppColors.blackColor,
      ),
    );
  }
}
