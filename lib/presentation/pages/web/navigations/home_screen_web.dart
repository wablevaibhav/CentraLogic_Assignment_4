import 'package:flutter/material.dart';
import 'package:my_document/presentation/pages/web/side_menu.dart';

class HomeScreenWeb extends StatelessWidget {
  const HomeScreenWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      body: Center(child: Text('sdgsg'),),
    );
  }
}
