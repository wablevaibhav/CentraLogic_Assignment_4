abstract class DocumentState {}

class DocumentsInitialState extends DocumentState {}

class DocumentsFetchedState extends DocumentState {}

class ShowTransactionDocumentsState extends DocumentState {
  final int transactionId;

  ShowTransactionDocumentsState({required this.transactionId});
}

class HideTransactionDocumentsState extends DocumentState {
  final int transactionId;

  HideTransactionDocumentsState({required this.transactionId});
}
