import 'package:flutter/material.dart';
import 'package:youtube_clone/widgets/image_button.dart';

class ChannelButtons extends StatelessWidget {
  const ChannelButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Row(
        children: [
          const Spacer(),
          Expanded(
            flex: 3,
            child: Container(
              height: 38,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Manage videos',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          Expanded(
            child: ImageButton(
              onPressed: () {},
              image: 'pen.png',
              hasBackgroundColor: true,
            ),
          ),
          Expanded(
            child: ImageButton(
              onPressed: () {},
              image: 'time-watched.png',
              hasBackgroundColor: true,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
