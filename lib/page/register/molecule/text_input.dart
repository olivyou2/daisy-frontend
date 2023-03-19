import 'package:flutter/material.dart';
import 'package:daisy_frontend/page/register/molecule/label.dart';

class TextInput extends StatefulWidget {
  const TextInput({super.key});

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Label(text: '닉네임', required: true),
        TextField(
          controller: _controller,
          decoration: const InputDecoration(
            hintText: '이름을 입력해주세요',
            suffix: Text('0/15'),
          ),
        ),
      ],
    );
  }
}
