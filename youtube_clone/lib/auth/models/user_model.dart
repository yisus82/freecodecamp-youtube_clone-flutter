// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  final String displayName;
  final String username;
  final String email;
  final String photoUrl;
  final List<String> subscriptions;
  final int videos;
  final String userId;
  final String description;
  final String type;
  UserModel({
    required this.displayName,
    required this.username,
    required this.email,
    required this.photoUrl,
    required this.subscriptions,
    required this.videos,
    required this.userId,
    required this.description,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'displayName': displayName,
      'username': username,
      'email': email,
      'photoUrl': photoUrl,
      'subscriptions': subscriptions,
      'videos': videos,
      'userId': userId,
      'description': description,
      'type': type,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      displayName: map['displayName'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      photoUrl: map['photoUrl'] as String,
      subscriptions: List<String>.from(map['subscriptions'] ?? []),
      videos: map['videos'] as int,
      userId: map['userId'] as String,
      description: map['description'] as String,
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
