import 'package:flutter/material.dart';

class ChannelTabBarView extends StatelessWidget {
  const ChannelTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: TabBarView(
        children: [
          Center(
            child: Text('Home'),
          ),
          Center(
            child: Text('Videos'),
          ),
          Center(
            child: Text('Shorts'),
          ),
          Center(
            child: Text('Community'),
          ),
          Center(
            child: Text('Playlists'),
          ),
          Center(
            child: Text('Channel'),
          ),
          Center(
            child: Text('About'),
          ),
        ],
      ),
    );
  }
}
