import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/data/constants/document_fields.dart';
import 'package:e_commerce/data/models/orders.dart';
import 'package:e_commerce/data/models/profile.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class CloudFirestore {
  final ordersCollection = FirebaseFirestore.instance.collection('orders');
  final profileCollection = FirebaseFirestore.instance.collection('profile');
  // orders collection
  Future<void> createOrder({
    required String userId,
    required Map<String, int> orders,
    required double total,
  }) async {
    final Timestamp dateTime = Timestamp.now();
    await ordersCollection.add({
      userIdField: userId,
      dateTimeField: dateTime,
      ordersField: orders,
      totalField: total,
    });
  }

  Future<Iterable<Orders>> historyOrders({required String userId}) async {
    try {
      return await ordersCollection
          .where(userIdField, isEqualTo: userId)
          .orderBy(dateTimeField, descending: true)
          .get()
          .then(
            (value) => value.docs.map((doc) => Orders.fromSnapshot(doc)),
          );
    } catch (e) {
      return [
        Orders(
          documentId: '',
          userId: userId,
          dateTime: Timestamp.now(),
          orders: {},
          total: 0,
        ),
      ];
    }
  }

  Future<void> createAddress({
    required String userId,
    required String address,
  }) async {
    try {
      await profileCollection.doc(userId).set({
        addressField: address,
      });
    } catch (e) {
      return;
    }
  }

  Future<Profile> getAddress({required String userId}) async {
    try {
      return await profileCollection.doc(userId).get().then(
            (value) => Profile.fromSnapshot(value),
          );
    } catch (e) {
      return Profile(address: '');
    }
  }
}
