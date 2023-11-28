import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/document_repository.dart';
import '../../domain/use_cases/document_use_case.dart';
import '../bloc/documents/document_bloc.dart';

class DocumentsBlocProvider extends BlocProvider<DocumentsBloc> {
  DocumentsBlocProvider({
    Key? key,
    required Widget child,
  }) : super(
    key: key,
    create: (context) => DocumentsBloc(
      documentUseCase: GetDocuments(repository: JsonDocumentRepository()),
    ),
    child: child,
  );

  static DocumentsBloc of(BuildContext context) =>
      BlocProvider.of<DocumentsBloc>(context);
}
