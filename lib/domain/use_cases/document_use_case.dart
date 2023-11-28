import 'package:my_document/data/entities/document.dart';
import 'package:my_document/data/repository/document_repository.dart';

abstract class DocumentUseCase {
  Future<List<Document>> getDocuments();
}

class GetDocuments implements DocumentUseCase {
   final DocumentRepository repository;

  GetDocuments({required this.repository});

  @override
  Future<List<Document>> getDocuments() async {
    final jsonData = await repository.fetchData();
    final List<Document> documents = [];
    return documents;
  }
}