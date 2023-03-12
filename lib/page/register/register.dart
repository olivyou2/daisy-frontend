import 'package:flutter/material.dart';
import 'package:daisy_frontend/page/register/text_input.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: null,
      body: Center(
        child: TextInput(),
      ),
    );
  }
}
