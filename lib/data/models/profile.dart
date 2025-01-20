import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/data/constants/document_fields.dart';
import 'package:flutter/foundation.dart' show immutable;

@immutable
class Profile {
  final String address;

  const Profile({required this.address});

  factory Profile.fromSnapshot(
          DocumentSnapshot<Map<String, dynamic>> snapshot) =>
      Profile(
        address: snapshot.data()?[addressField],
      );
}
