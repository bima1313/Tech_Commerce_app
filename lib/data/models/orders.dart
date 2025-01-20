import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/data/constants/document_fields.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class Orders {
  final String documentId;
  final String userId;
  final Timestamp dateTime;
  final Map<String, dynamic> orders;
  final double total;

  const Orders({
    required this.documentId,
    required this.userId,
    required this.dateTime,
    required this.orders,
    required this.total,
  });

  Orders.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : documentId = snapshot.id,
        userId = snapshot.data()[userIdField],
        dateTime = snapshot.data()[dateTimeField],
        orders = snapshot.data()[ordersField],
        total = snapshot.data()[totalField];
}
