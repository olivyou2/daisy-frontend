import 'package:daisy_frontend/page/register/molecule/button_container.dart';
import 'package:daisy_frontend/page/register/molecule/date_picker.dart';
import 'package:daisy_frontend/page/register/molecule/location_picker.dart';
import 'package:daisy_frontend/page/register/molecule/text_input.dart';
import 'package:daisy_frontend/page/register/molecule/toggle_button.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: const [
              ButtonContainer(),
              SizedBox(height: 32),
              TextInput(),
              SizedBox(height: 40),
              ToggleButton(),
              SizedBox(height: 40),
              DatePicker(),
              SizedBox(height: 40),
              LocationPicker()
            ],
          ),
        ),
      ),
    );
  }
}
