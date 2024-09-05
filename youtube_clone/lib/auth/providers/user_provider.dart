import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/auth/models/user_model.dart';
import 'package:youtube_clone/auth/repository/user_data_service.dart';

final currentUserProvider = FutureProvider<UserModel>((ref) async {
  final UserModel user =
      await ref.watch(userDataServiceProvider).fetchCurrentUser();
  return user;
});
