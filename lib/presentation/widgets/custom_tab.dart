import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  final String text;
  final bool isSelected;

  const CustomTab({required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Tab(
        child: Text(text),
      ),
    );
  }
}
