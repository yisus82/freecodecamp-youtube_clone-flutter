import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:youtube_clone/auth/repository/user_data_service.dart';
import 'package:youtube_clone/widgets/flat_button.dart';

final _formKey = GlobalKey<FormState>();

class UsernamePage extends ConsumerStatefulWidget {
  final String displayName;
  final String email;
  final String photoUrl;
  const UsernamePage({
    super.key,
    required this.displayName,
    required this.email,
    required this.photoUrl,
  });

  @override
  ConsumerState<UsernamePage> createState() => _UsernamePageState();
}

class _UsernamePageState extends ConsumerState<UsernamePage> {
  final TextEditingController _usernameController = TextEditingController();
  bool _isUsernameValid = true;
  bool _isUsernameFormFieldTouched = false;

  bool _isFormValid() {
    return _isUsernameFormFieldTouched && _isUsernameValid;
  }

  void _validateUsername(String value) async {
    if (!_isUsernameFormFieldTouched) {
      setState(() {
        _isUsernameFormFieldTouched = true;
      });
    }

    if (value.isEmpty) {
      setState(() {
        _isUsernameValid = false;
      });
      return;
    }

    final users = await FirebaseFirestore.instance.collection('users').get();
    final usernames = users.docs.map((user) => user['username']).toList();

    if (usernames.contains(value)) {
      setState(() {
        _isUsernameValid = false;
      });
    } else {
      setState(() {
        _isUsernameValid = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 26,
                horizontal: 14,
              ),
              child: Text(
                'Username',
                style: TextStyle(color: Colors.blueGrey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              child: Form(
                child: TextFormField(
                  key: _formKey,
                  controller: _usernameController,
                  onChanged: (value) {
                    _validateUsername(value);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Username cannot be empty';
                    } else if (!_isUsernameValid) {
                      return 'Username already exists';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    suffixIcon: _isUsernameFormFieldTouched
                        ? _isUsernameValid
                            ? const Icon(
                                Icons.verified_user_rounded,
                                color: Colors.green,
                              )
                            : const Icon(
                                Icons.close,
                                color: Colors.red,
                              )
                        : null,
                    hintText: 'Enter your username',
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 30,
                left: 15,
                right: 15,
              ),
              child: FlatButton(
                text: 'Next',
                onPressed: () async {
                  if (_isFormValid()) {
                    await ref
                        .read(userDataServiceProvider)
                        .addUserDataToFirestore(
                          displayName: widget.displayName,
                          username: _usernameController.text,
                          email: widget.email,
                          description: '',
                          photoUrl: widget.photoUrl,
                        );
                  }
                },
                colour: _isFormValid() ? Colors.green : Colors.green.shade100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
