import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/auth/providers/user_provider.dart';
import 'package:youtube_clone/widgets/error_text.dart';
import 'package:youtube_clone/widgets/image_button.dart';
import 'package:youtube_clone/widgets/loader.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/youtube.jpg',
                  height: 36,
                ),
                const SizedBox(width: 4),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: SizedBox(
                    height: 42,
                    child: ImageButton(
                      image: 'cast.png',
                      onPressed: () {},
                    ),
                  ),
                ),
                SizedBox(
                  height: 38,
                  child: ImageButton(
                    image: 'notification.png',
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 15),
                  child: SizedBox(
                    height: 41.5,
                    child: ImageButton(
                      image: 'search.png',
                      onPressed: () {},
                    ),
                  ),
                ),
                Consumer(builder: (context, ref, child) {
                  return ref.watch(currentUserProvider).when(
                        data: (user) => Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.grey,
                            backgroundImage: CachedNetworkImageProvider(
                              user.photoUrl,
                            ),
                          ),
                        ),
                        error: (error, stack) => const ErrorText(),
                        loading: () => const Loader(),
                      );
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
