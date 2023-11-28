import 'JoiningDocument.dart';
import 'TaxDocument.dart';
import 'TeamDocument.dart';
import 'TransactionDocument.dart';

class DocumentCategory {
  final List<JoiningDocument> joining;
  final List<TransactionDocument> transaction;
  final List<TeamDocument> team;
  final List<TaxDocument> tax;

  DocumentCategory({
    required this.joining,
    required this.transaction,
    required this.team,
    required this.tax,
  });

  factory DocumentCategory.fromJson(Map<String, dynamic> json) {
    final List<JoiningDocument> joining = (json['value'][0]['joining'] as List)
        .map((joiningJson) => JoiningDocument.fromJson(joiningJson))
        .toList();

    final List<TransactionDocument> transaction = (json['value'][0]
            ['transaction'] as List)
        .map((transactionJson) => TransactionDocument.fromJson(transactionJson))
        .toList();

    final List<TeamDocument> team = (json['value'][0]['team'] as List)
        .map((teamJson) => TeamDocument.fromJson(teamJson))
        .toList();

    final List<TaxDocument> tax = (json['value'][0]['tax'] as List)
        .map((taxJson) => TaxDocument.fromJson(taxJson))
        .toList();

    return DocumentCategory(
      joining: joining,
      transaction: transaction,
      team: team,
      tax: tax,
    );
  }
}
