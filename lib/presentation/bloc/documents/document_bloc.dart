// documents_bloc.dart
import 'dart:async';

import '../../../data/entities/document.dart';
import '../../../domain/use_cases/document_use_case.dart';
import 'documents_event.dart';
import 'documents_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DocumentsBloc extends Bloc<DocumentsEvent, DocumentsState> {
  final DocumentUseCase documentUseCase;

  DocumentsBloc({required this.documentUseCase}) : super(DocumentsInitial());

  @override
  Stream<DocumentsState> mapEventToState(
      DocumentsEvent event,
      ) async* {
    if (event is FetchDocuments) {
      yield DocumentsLoading();

      try {
        final List<Document> documents = await documentUseCase.getDocuments();
        yield DocumentsLoaded(documents: documents);
      } catch (e) {
        yield DocumentsError(error: e.toString());
      }
    }
  }
}

