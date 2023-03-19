import 'package:daisy_frontend/main/widgets/atom/map.dart';
import 'package:daisy_frontend/main/widgets/molecule/topindicator.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(body: const NaverMap());

    return Scaffold(
      body: DraggableScrollableSheet(
        snap: true,
        snapSizes: const [0.05, (844 - 58) / 844],
        initialChildSize: 0.05,
        minChildSize: 0.05,
        maxChildSize: (844 - 58) / 844,
        builder: (BuildContext context, ScrollController scrollController) {
          return Column(
            children: [
              SingleChildScrollView(
                controller: scrollController,
                physics: const ClampingScrollPhysics(),
                child: const TopIndicator(),
              ),
              const DaisyMap()
            ],
          );
        },
      ),
    );
  }
}
