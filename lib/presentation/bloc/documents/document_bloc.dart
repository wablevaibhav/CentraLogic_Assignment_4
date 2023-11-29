import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/entities/document.dart';
import 'document_event.dart';
import 'document_state.dart';

class DocumentBloc extends Bloc<DocumentEvent, DocumentState> {
  DocumentBloc()
      : super(
          DocumentsInitialState(),
        ) {
    on<DocumentsInitialFetchEvent>(
      documentsFetchEvent,
    );

    on<LoadTransactionDocumentsEvent>(
      (event, emit) {
        debugPrint('Transaction ID: ${event.transactionId}');
        debugPrint(
            "Transaction Documents: ${DocumentsData.transactions[0].documents}");
        emit(
          ShowTransactionDocumentsState(
            transactionId: event.transactionId,
          ),
        );
      },
    );

    on<HideTransactionDocumentsEvent>(
      (event, emit) {
        emit(
          HideTransactionDocumentsState(
            transactionId: event.transactionId,
          ),
        );
      },
    );
  }

  void documentsFetchEvent(
      DocumentsInitialFetchEvent event, Emitter<DocumentState> emit) async {
    String jsonString =
        await rootBundle.loadString('assets/document.json');

    ModelDocuments documentsModel =
        ModelDocuments.fromJson(jsonDecode(jsonString));

    List<Value> values = documentsModel.value;

    DocumentsData.setDocumentsData(
      transactions: values[0].transaction,
      team: values[0].team,
      tax: values[0].tax,
      joining: values[0].joining,
    );
    emit(DocumentsFetchedState());
  }
}
