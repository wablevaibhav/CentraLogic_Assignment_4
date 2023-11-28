import '../../../data/entities/document.dart';

abstract class DocumentsState {}

class DocumentsInitial extends DocumentsState {}

class DocumentsLoading extends DocumentsState {}

class DocumentsLoaded extends DocumentsState {
  final List<Document> documents;

  DocumentsLoaded({required this.documents});
}

class DocumentsError extends DocumentsState {
  final String error;

  DocumentsError({required this.error});
}
