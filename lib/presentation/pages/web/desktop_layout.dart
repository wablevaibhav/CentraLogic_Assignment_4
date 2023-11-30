import 'package:flutter/material.dart';
import 'package:my_document/presentation/pages/web/navigations/desktop_home.dart';
import 'widgets/side_bar.dart';

// LAYOUT SCREEN -> DESKTOP
class DesktopLayoutScreen extends StatefulWidget {
  const DesktopLayoutScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
