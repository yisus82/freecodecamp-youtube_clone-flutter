import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/auth/providers/user_provider.dart';
import 'package:youtube_clone/channel/my_channel/repository/settings_provider.dart';
import 'package:youtube_clone/channel/my_channel/widgets/channel_settings_dialog.dart';
import 'package:youtube_clone/channel/my_channel/widgets/channel_settings_item.dart';
import 'package:youtube_clone/widgets/error_text.dart';
import 'package:youtube_clone/widgets/loader.dart';

class MyChannelSettingsPage extends ConsumerStatefulWidget {
  const MyChannelSettingsPage({super.key});

  @override
  ConsumerState<MyChannelSettingsPage> createState() =>
      _MyChannelSettingsPageState();
}

class _MyChannelSettingsPageState extends ConsumerState<MyChannelSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(currentUserProvider).when(
          data: (currentUser) => Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 170,
                          width: double.infinity,
                          child: Image.asset(
                            'assets/images/flutter_background.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          left: 16,
                          top: 10,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey,
                            backgroundImage: CachedNetworkImageProvider(
                              currentUser.photoUrl,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 16,
                          top: 10,
                          child: Image.asset(
                            'assets/icons/camera.png',
                            height: 34,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    ChannelSettingsItem(
                      identifier: 'Display Name',
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => ChannelSettingsDialog(
                            title: 'Display Name',
                            text: currentUser.displayName,
                            isRequired: true,
                            onSave: (name) {
                              ref
                                  .watch(settingsProvider)
                                  .updateDisplayName(name);
                            },
                          ),
                        );
                      },
                      value: currentUser.displayName,
                    ),
                    const SizedBox(height: 14),
                    ChannelSettingsItem(
                      identifier: 'Username',
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => ChannelSettingsDialog(
                            title: 'Username',
                            text: currentUser.username,
                            isRequired: true,
                            onSave: (username) {
                              ref
                                  .watch(settingsProvider)
                                  .updateUsername(username);
                            },
                          ),
                        );
                      },
                      value: currentUser.username,
                    ),
                    const SizedBox(height: 14),
                    ChannelSettingsItem(
                      identifier: 'Description',
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => ChannelSettingsDialog(
                            title: 'Description',
                            text: currentUser.description,
                            onSave: (description) {
                              ref
                                  .watch(settingsProvider)
                                  .updateDescription(description);
                              build(context);
                            },
                          ),
                        );
                      },
                      value: currentUser.description,
                    ),
                  ],
                ),
              ),
            ),
          ),
          error: (error, stackTrace) => const ErrorText(),
          loading: () => const Loader(),
        );
  }
}
