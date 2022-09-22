import 'package:flutter/material.dart';
import 'package:road_map_flutter/components/box_content.dart';
import 'package:road_map_flutter/road_map/res/app_content.dart';

class AlertDialogExtend extends StatelessWidget {
  const AlertDialogExtend({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(child: Text(LEGEND)),
      content: Container(
        constraints: const BoxConstraints(
          maxHeight: 175,
        ),
        child: Column(
          children: const [
            BoxContent(
              content: MUST_HAVE,
              index: 3,
              color: 1,
            ),
            BoxContent(
              content: NICE_HAVE,
              index: 3,
              color: 2,
            ),
            BoxContent(
              content: OPTION,
              index: 3,
              color: 3,
            ),
          ],
        ),
      ),
      actions: <Widget>[
        OutlinedButton(
          child: const Text(CANCLE),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        const SizedBox(width: 5),
      ],
    );
  }
}
