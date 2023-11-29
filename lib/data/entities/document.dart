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

class TransactionDocument {
  late String title;
  late String checkListName;
  late String date;
  late String status;
  late String url;

  TransactionDocument({
    required this.title,
    required this.checkListName,
    required this.date,
    required this.status,
    required this.url,
  });

  factory TransactionDocument.fromJson(Map<String, dynamic> json) {
    return TransactionDocument(
      title: json['title'],
      checkListName: json['checkListName'],
      date: json['date'],
      status: json['status'],
      url: json['url'],
    );
  }
}

class Transaction {
  late String address;
  late int transactionId;
  late List<TransactionDocument> documents;

  Transaction({
    required this.address,
    required this.transactionId,
    required this.documents,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    List<dynamic> documentsList = json['documents'];
    List<TransactionDocument> documents = documentsList
        .map((documentJson) => TransactionDocument.fromJson(documentJson))
        .toList();

    return Transaction(
      address: json['address'],
      transactionId: json['transactionId'],
      documents: documents,
    );
  }
}

class Joining {
  late String title;
  late String size;
  late String url;

  Joining({
    required this.title,
    required this.size,
    required this.url,
  });

  factory Joining.fromJson(Map<String, dynamic> json) {
    return Joining(
      title: json['title'],
      size: json['size'],
      url: json['url'],
    );
  }
}

class Team {
  late String title;
  late String size;
  late String url;

  Team({
    required this.title,
    required this.size,
    required this.url,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(title: json['title'], size: json['size'], url: json['url']);
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
