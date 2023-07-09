import 'package:daisy_frontend/page/register/widgets/molecule/button_container.dart';
import 'package:daisy_frontend/page/register/widgets/molecule/date_picker.dart';
import 'package:daisy_frontend/page/register/widgets/molecule/location_picker.dart';
import 'package:daisy_frontend/page/register/widgets/molecule/start_button.dart';
import 'package:daisy_frontend/page/register/widgets/molecule/text_input.dart';
import 'package:daisy_frontend/page/register/widgets/molecule/toggle_button.dart';
import 'package:daisy_frontend/util/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 60.h),
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
              LocationPicker(),
              SizedBox(height: 40),
              StartButton()
            ],
          ),
        ),
      ),
    );
  }
}
