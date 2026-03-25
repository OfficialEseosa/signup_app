import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  final String fullName;

  const WelcomeScreen({super.key, required this.fullName});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String _selectedAvatar = '😊';
  final List<String> _avatarOptions = ['😊', '🚀', '🎉', '💜', '🌟', '🎨', '✨', '🔥'];

  void _showAvatarPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick Your Avatar'),
          content: SizedBox(
            width: double.maxFinite,
            child: GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              children: _avatarOptions.map((emoji) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedAvatar = emoji;
                    });
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: _selectedAvatar == emoji
                          ? Border.all(color: Colors.purple, width: 2)
                          : null,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        emoji,
                        style: const TextStyle(fontSize: 32),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cash Money"),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: GestureDetector(
                onTap: _showAvatarPicker,
                child: Text(
                  _selectedAvatar,
                  style: const TextStyle(fontSize: 32),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _selectedAvatar,
              style: const TextStyle(fontSize: 64),
            ),
            const SizedBox(height: 20),
            Text(
              'Welcome ${widget.fullName}',
              style: const TextStyle(fontSize: 32),
            ),
          ],
        ),
      ),
    );
  }
}