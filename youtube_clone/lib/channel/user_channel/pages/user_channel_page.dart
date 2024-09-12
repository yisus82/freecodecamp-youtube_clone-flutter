// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/auth/providers/user_provider.dart';
import 'package:youtube_clone/widgets/error_text.dart';
import 'package:youtube_clone/widgets/flat_button.dart';
import 'package:youtube_clone/widgets/loader.dart';

class UserChannelPage extends StatefulWidget {
  final String userId;
  const UserChannelPage({
    super.key,
    required this.userId,
  });

  @override
  State<UserChannelPage> createState() => _UserChannelPageState();
}

class _UserChannelPageState extends State<UserChannelPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Consumer(
            builder: (context, ref, child) {
              return ref.watch(userDataProvider(widget.userId)).when(
                    data: (user) => Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.asset('assets/images/flutter_background.png'),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 12,
                            right: 12,
                            top: 20,
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 38,
                                backgroundColor: Colors.grey,
                                backgroundImage: CachedNetworkImageProvider(
                                  user.photoUrl,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 12,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        user.displayName,
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '@${user.username}',
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          style: const TextStyle(
                                            fontSize: 13,
                                            color: Colors.blueGrey,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          children: [
                                            TextSpan(
                                                text:
                                                    '${user.subscriptions.length} subscriptions  '),
                                            TextSpan(
                                                text: '${user.videos} videos'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 8, right: 8, bottom: 10),
                          child: FlatButton(
                            text: 'Susbscribe',
                            onPressed: () {},
                            colour: Colors.black,
                          ),
                        ),
                        user.videos == 0
                            ? Center(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top:
                                        MediaQuery.sizeOf(context).height * 0.2,
                                  ),
                                  child: const Text(
                                    'No Videos',
                                    style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            : Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 14),
                                child: Text(
                                  "${user.displayName}'s Videos ",
                                  style: const TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                      ],
                    ),
                    error: (error, stackTrace) => const ErrorText(),
                    loading: () => const Loader(),
                  );
            },
          ),
        ],
      )),
    );
  }
}
