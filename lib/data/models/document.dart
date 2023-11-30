import 'package:my_document/data/models/TransactionDocument.dart';

import 'Joining.dart';

class DocumentsData {
  static List<Transaction> transactions = [];
  static List<Joining> team = [];
  static List<Joining> tax = [];
  static List<Joining> joining = [];

  static setDocumentsData(
      {required List<Transaction> transactions,
      required List<Joining> team,
      required List<Joining> tax,
      required List<Joining> joining}) {
    DocumentsData.transactions = transactions;
    DocumentsData.team = team;
    DocumentsData.tax = tax;
    DocumentsData.joining = joining;
  }
}

class Document {
  late String title;
  late String size;
  late String url;

  Document({
    required this.title,
    required this.size,
    required this.url,
  });

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      title: json['title'],
      size: json['size'],
      url: json['url'],
    );
  }
}

class Value {
  late List<Joining> joining;
  late List<Transaction> transaction;
  late List<Joining> team;
  late List<Joining> tax;

  Value({
    required this.joining,
    required this.transaction,
    required this.team,
    required this.tax,
  });

  factory Value.fromJson(Map<String, dynamic> json) {
    List<dynamic> joiningList = json['joining'];
    List<Joining> joining = joiningList
        .map((joiningJson) => Joining.fromJson(joiningJson))
        .toList();

    List<dynamic> transactionList = json['transaction'];
    List<Transaction> transaction = transactionList
        .map((transactionJson) => Transaction.fromJson(transactionJson))
        .toList();

    List<dynamic> teamList = json['team'];
    List<Joining> team =
        teamList.map((teamJson) => Joining.fromJson(teamJson)).toList();

    List<dynamic> taxList = json['tax'];
    List<Joining> tax =
        taxList.map((taxJson) => Joining.fromJson(taxJson)).toList();

    return Value(
      joining: joining,
      transaction: transaction,
      team: team,
      tax: tax,
    );
  }
}

class ModelDocuments {
  late List<Value> value;

  ModelDocuments({
    required this.value,
  });

  factory ModelDocuments.fromJson(Map<String, dynamic> json) {
    List<dynamic> valueList = json['value'];
    List<Value> value =
        valueList.map((valueJson) => Value.fromJson(valueJson)).toList();

    return ModelDocuments(
      value: value,
    );
  }
}
