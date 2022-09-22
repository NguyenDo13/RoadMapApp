import 'package:flutter/material.dart';
import 'package:road_map_flutter/road_map/res/colors.dart';
import 'package:road_map_flutter/utils/functions_utils.dart';

class BoxContent extends StatefulWidget {
  final String content;
  final int index;
  final int color;

  const BoxContent({
    super.key,
    required this.content,
    required this.index,
    required this.color,
  });

  @override
  State<BoxContent> createState() => _BoxContentState();
}

class _BoxContentState extends State<BoxContent> {
  late bool lineThrough = false;

  @override
  Widget build(BuildContext context) {
    final minHeight = getMinHeight(widget.index);
    return InkWell(
      onTap: () {
        setState(() {
          lineThrough = !lineThrough;
        });
      },
      onLongPress: () {},
      child: Container(
        margin: const EdgeInsets.all(4),
        constraints: BoxConstraints(minHeight: minHeight),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: listColors[widget.color - 1],
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Container(
          margin: const EdgeInsets.fromLTRB(10, 6, 10, 6),
          child: Center(
            child: Text(
              widget.content,
              maxLines: 2,
              style: TextStyle(
                decoration: lineThrough
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                color: Colors.black,
                fontSize: 12,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
