import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/auth/providers/user_provider.dart';
import 'package:youtube_clone/channel/my_channel/widgets/channel_buttons.dart';
import 'package:youtube_clone/channel/my_channel/widgets/channel_tab_bar.dart';
import 'package:youtube_clone/channel/my_channel/widgets/channel_tab_bar_view.dart';
import 'package:youtube_clone/channel/my_channel/widgets/channel_user_info.dart';
import 'package:youtube_clone/widgets/error_text.dart';
import 'package:youtube_clone/widgets/loader.dart';

class MyChannelPage extends ConsumerWidget {
  const MyChannelPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(currentUserProvider).when(
          data: (user) => DefaultTabController(
            length: 7,
            child: Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      ChannelUserInfo(user: user),
                      const Text('More about this channel'),
                      const ChannelButtons(),
                      const ChannelTabBar(),
                      const ChannelTabBarView(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          error: (error, stack) => const ErrorText(),
          loading: () => const Loader(),
        );
  }
}
