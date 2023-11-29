

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_document/presentation/bloc/documents/document_bloc.dart';
import 'package:my_document/presentation/pages/layout_home.dart';
import 'package:my_document/presentation/themes/app_colors.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
        create: (context) => DocumentBloc())
  ], child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Documents',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.whiteColor,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.whiteColor,primary: AppColors.primaryColor)
      ),
      home: LayoutHome(),
    );
  }
}
