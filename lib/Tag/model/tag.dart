import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Tag extends Equatable {
  final String tagId;
  final String title;
  final double amount;
  final int color;
  final Timestamp createdAt;
  final Timestamp updatedAt;

  Tag({
    this.tagId,
    this.title,
    this.amount,
    this.color,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object> get props => [
        tagId,
        title,
        amount,
        color,
        createdAt,
        updatedAt,
      ];

  Tag.fromJsonSnapshot(DocumentSnapshot doc)
      : tagId = doc.id,
        title = doc.get('title'),
        amount = doc.get('amount'),
        color = doc.get('color'),
        createdAt = doc.get('created_at'),
        updatedAt = doc.get('updated_at');
}
