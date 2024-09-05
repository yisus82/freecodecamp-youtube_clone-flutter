import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/auth/models/user_model.dart';

final userDataServiceProvider = Provider<UserDataService>((ref) {
  return UserDataService(
    auth: FirebaseAuth.instance,
    firestore: FirebaseFirestore.instance,
  );
});

class UserDataService {
  FirebaseAuth auth;
  FirebaseFirestore firestore;
  UserDataService({
    required this.auth,
    required this.firestore,
  });

  addUserDataToFirestore({
    required String displayName,
    required String username,
    required String email,
    required String description,
    required String photoUrl,
  }) async {
    UserModel user = UserModel(
      displayName: displayName,
      username: username,
      email: email,
      photoUrl: photoUrl,
      subscriptions: [],
      videos: 0,
      userId: auth.currentUser!.uid,
      description: description,
      type: 'user',
    );
    await firestore.collection('users').doc(user.userId).set(user.toMap());
  }

  Future<UserModel> fetchCurrentUser() async {
    final user = auth.currentUser;
    final userDoc = await firestore.collection('users').doc(user!.uid).get();
    return UserModel.fromMap(userDoc.data()!);
  }
}
