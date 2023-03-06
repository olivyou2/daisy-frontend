import 'package:flutter/material.dart';

class SocialBtn extends StatelessWidget {
  final Widget child;
  final String type;

  const SocialBtn({super.key, required this.child, required this.type});

  onTapBtn() {
    print("Tapped " + type);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(child: child, onTap: onTapBtn);
  }
}
