import 'package:flutter/material.dart';

class ChannelTabBar extends StatelessWidget {
  const ChannelTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 14),
      child: TabBar(
        isScrollable: true,
        labelStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: EdgeInsets.only(top: 12),
        tabs: [
          Text(
            'Home',
            style: TextStyle(color: Colors.black),
          ),
          Text(
            'Videos',
            style: TextStyle(color: Colors.black),
          ),
          Text(
            'Shorts',
            style: TextStyle(color: Colors.black),
          ),
          Text(
            'Community',
            style: TextStyle(color: Colors.black),
          ),
          Text(
            'Playlists',
            style: TextStyle(color: Colors.black),
          ),
          Text(
            'Channels',
            style: TextStyle(color: Colors.black),
          ),
          Text(
            'About',
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
