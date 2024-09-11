// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingsProvider = Provider(
  (ref) => SettingsField(
    firestore: FirebaseFirestore.instance,
    auth: FirebaseAuth.instance,
  ),
);

class SettingsField {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  SettingsField({
    required this.firestore,
    required this.auth,
  });

  updateDisplayName(displayName) async {
    await firestore.collection('users').doc(auth.currentUser!.uid).update({
      'displayName': displayName,
    });
  }

  updateUsername(username) async {
    await firestore.collection('users').doc(auth.currentUser!.uid).update({
      'username': username,
    });
  }

  updateDescription(description) async {
    await firestore.collection('users').doc(auth.currentUser!.uid).update({
      'description': description,
    });
  }
}
