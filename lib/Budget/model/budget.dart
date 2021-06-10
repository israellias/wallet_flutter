import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Budget extends Equatable {
  final String budgetId;
  final String title;
  final double amount;
  final int color;
  final Timestamp createdAt;
  final Timestamp updatedAt;

  Budget({
    this.budgetId,
    this.title,
    this.amount,
    this.color,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object> get props => [
        budgetId,
        title,
        amount,
        color,
        createdAt,
        updatedAt,
      ];

  Budget.fromJsonSnapshot(DocumentSnapshot doc)
      : budgetId = doc.id,
        title = doc.get('title'),
        amount = doc.get('amount'),
        color = doc.get('color'),
        createdAt = doc.get('created_at'),
        updatedAt = doc.get('updated_at');
}
