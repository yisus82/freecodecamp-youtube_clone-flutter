// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/auth/models/user_model.dart';

class ChannelUserInfo extends StatelessWidget {
  final UserModel user;
  const ChannelUserInfo({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: CircleAvatar(
            radius: 38,
            backgroundColor: Colors.grey,
            backgroundImage: CachedNetworkImageProvider(user.photoUrl),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 4),
          child: Text(
            user.displayName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 9),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(
                color: Colors.blueGrey,
              ),
              children: [
                TextSpan(text: '@${user.username}  '),
                TextSpan(
                  text: user.subscriptions.isEmpty
                      ? 'No subscriptions  '
                      : '${user.subscriptions.length} subscriptions  ',
                ),
                TextSpan(
                  text:
                      user.videos == 0 ? 'No videos' : '${user.videos} videos',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
