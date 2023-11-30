// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_document/core/utils/app_colors.dart';
import 'package:my_document/data/models/TransactionDocument.dart';
import 'package:my_document/presentation/bloc/document/document_bloc.dart';
import 'package:my_document/presentation/bloc/document/document_event.dart';
import 'package:my_document/presentation/bloc/document/document_state.dart';
import 'package:my_document/presentation/widgets/BuildTransactionTable.dart';
import 'package:my_document/presentation/widgets/SubtitleText.dart';
import 'package:my_document/presentation/widgets/TitleText.dart';

// ignore: must_be_immutable
class BuildTransactionTab extends StatelessWidget {
  List<Transaction> transaction;

  BuildTransactionTab({
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 728,
      child: ListView.separated(
          itemBuilder: (context, index) {
            final documentbloc = DocumentBloc();
            return BlocProvider.value(
              value: documentbloc,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                  ),
                  title: getTitleText(transaction[index].address),
                  subtitle: getSubtitleText(
                      "Transaction ID #${transaction[index].transactionId}"),
                  trailing: BlocBuilder<DocumentBloc, DocumentState>(
                    builder: (context, state) {
                      if (state is ShowTransactionDocumentsState) {
                        return IconButton(
                          onPressed: () {
                            BlocProvider.of<DocumentBloc>(context).add(
                              HideTransactionDocumentsEvent(
                                transactionId: transaction[index].transactionId,
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.keyboard_arrow_up,
                            color: Colors.grey,
                          ),
                        );
                      }
                      return IconButton(
                        onPressed: () {
                          BlocProvider.of<DocumentBloc>(context).add(
                            LoadTransactionDocumentsEvent(
                              transactionId: transaction[index].transactionId,
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.arrow_right,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                  titleAlignment: ListTileTitleAlignment.center,
                  shape: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.tabUnderlineColor,
                      width: 1,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                BlocBuilder<DocumentBloc, DocumentState>(
                  builder: (context, state) =>
                      state is ShowTransactionDocumentsState &&
                              state.transactionId ==
                                  transaction[index].transactionId
                          ? BuildTransactionTable(
                              documents: transaction[index].documents,
                            )
                          : state is HideTransactionDocumentsState
                              ? const SizedBox()
                              : const SizedBox(),
                )
              ]),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
          itemCount: transaction.length),
    );
  }
}
