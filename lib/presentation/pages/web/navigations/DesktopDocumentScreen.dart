import 'package:flutter/material.dart';

import '../../../widgets/SideBar.dart';

class DocumentScreenWeb extends StatefulWidget {
  const DocumentScreenWeb({super.key});

  @override
  State<DocumentScreenWeb> createState() => _DocumentScreenWebState();
}

class _DocumentScreenWebState extends State<DocumentScreenWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenu(),
      body: Center(child: Text('sdgsg'),),
    );
  }
}
