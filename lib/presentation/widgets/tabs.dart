import 'package:flutter/material.dart';
import 'package:my_document/core/utils/app_colors.dart';
import 'package:my_document/presentation/widgets/pdf_view.dart';
import 'package:my_document/presentation/widgets/subtitle_text.dart';
import 'package:my_document/presentation/widgets/title_text.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';

import '../../data/models/joining.dart';

// (JOINING -> TEAM -> TAX)  TAB
Builder buildTabs({required List<Joining> documents}) {
  return Builder(
    builder: (context) => SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          titleAlignment: ListTileTitleAlignment.center,
          shape: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.tabUnderline, width: 1),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          leading: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(05),
              color: AppColors.tabBackground,
            ),
            child: Image.asset("assets/pdf.png"),
          ),
          title: titleText(documents[index].title),
          subtitle: subtitleText(documents[index].size),
          trailing: IconButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        PdfViewerScreen(url: documents[index].url),
                  ),
                );
                // launch(documents[index].url);
              },
              icon: const Icon(
                Icons.remove_red_eye_outlined,
                color: AppColors.icon,
              )),
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: documents.length,
      ),
    ),
  );
}
