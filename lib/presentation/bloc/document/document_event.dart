abstract class DocumentEvent {}

class DocumentsInitialFetchEvent extends DocumentEvent {}

class LoadTransactionDocumentsEvent extends DocumentEvent {
  final int transactionId;

  LoadTransactionDocumentsEvent({ required this.transactionId});
}

class HideTransactionDocumentsEvent extends DocumentEvent {
  final int transactionId;

  HideTransactionDocumentsEvent({ required this.transactionId });
}
