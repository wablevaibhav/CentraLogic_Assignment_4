import 'package:flutter/material.dart';

TableCell getHeadTableCell({required String text}) => TableCell(
  child: Container(
    height: 50,
    padding: const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 15,
    ),
    child: Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: "Roboto",
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(
              48,
              48,
              48,
              1,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        const Icon(
          Icons.arrow_drop_down,
          color: Colors.grey,
        ),
      ],
    ),
  ),
);