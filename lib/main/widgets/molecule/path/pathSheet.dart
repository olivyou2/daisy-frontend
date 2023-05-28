import 'package:daisy_frontend/main/widgets/molecule/path/pathSheetIndicator.dart';
import 'package:flutter/material.dart';

class PathSheet extends StatefulWidget {
  const PathSheet({super.key});

  @override
  State<PathSheet> createState() => _PathSheetState();
}

class _PathSheetState extends State<PathSheet> {
  bool animationDone = true;

  DraggableScrollableController sheetController =
      DraggableScrollableController();

  double closePosition = 0.4;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double minChildSize = closePosition;
    double maxChildSize = 0.5;

    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: minChildSize,
      maxChildSize: maxChildSize,
      snap: true,
      snapSizes: [minChildSize, maxChildSize],
      controller: sheetController,
      builder: (BuildContext context, ScrollController scrollController) {
        return Column(
          children: [
            SingleChildScrollView(
              controller: scrollController,
              // reverse: true,
              physics: const ClampingScrollPhysics(),
              child: Column(children: const [PathTopIndicator()]),
            ),
          ],
        );
      },
    );
  }
}
