import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/entities/document.dart';
import 'SubtitleText.dart';
import 'TitleText.dart';

SizedBox buildOtherTabs({required List<Joining> documents}) => SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          titleAlignment: ListTileTitleAlignment.center,
          shape: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromRGBO(
                48,
                48,
                48,
                0.05,
              ),
              width: 1,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          leading: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(05),
              color: const Color.fromRGBO(
                252,
                227,
                205,
                1,
              ),
            ),
            child: Image.asset("assets/pdf.png"),
          ),
          title: getTitleText(documents[index].title),
          subtitle: getSubtitleText(documents[index].size),
          trailing: IconButton(
            onPressed: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PDFView(
                filePath: documents[index].url,
                enableSwipe: true,
                swipeHorizontal: true,
              )));
             // launch(documents[index].url);
            },
            icon: const Icon(
              Icons.remove_red_eye_outlined,
              color: Color.fromRGBO(
                35,
                97,
                219,
                1,
              ),
            ),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemCount: documents.length,
      ),
    );