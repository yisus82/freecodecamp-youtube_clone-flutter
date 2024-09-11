import 'package:flutter/material.dart';

class ChannelSettingsDialog extends StatefulWidget {
  final String title;
  final String text;
  final Function(String channelName) onSave;
  final bool isRequired;
  const ChannelSettingsDialog({
    super.key,
    required this.title,
    required this.text,
    required this.onSave,
    this.isRequired = false,
  });

  @override
  State<ChannelSettingsDialog> createState() => _ChannelSettingsDialogState();
}

class _ChannelSettingsDialogState extends State<ChannelSettingsDialog> {
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _controller.text = widget.text;

    return AlertDialog(
      titlePadding: const EdgeInsets.only(top: 0),
      title: Padding(
        padding: const EdgeInsets.only(left: 22, top: 8),
        child: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
      ),
      content: SizedBox(
        height: 50,
        child: TextField(
          controller: _controller,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.black),
          ),
        ),
        TextButton(
          onPressed: () {
            if (widget.isRequired && _controller.text.isEmpty) {
              showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                        title: const Text('Error'),
                        content: const Text('This field is required'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ));
              return;
            }
            widget.onSave(_controller.text);
            Navigator.pop(context);
          },
          child: const Text(
            'Save',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
