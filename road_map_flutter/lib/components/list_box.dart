import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:road_map_flutter/components/box_content.dart';
import 'package:road_map_flutter/road_map/models/topics.dart';

class ListBox extends StatelessWidget {
  final List<Topics> topics;
  const ListBox({super.key, required this.topics});

  @override
  Widget build(BuildContext context) {
    double heightBox = topics.length.toDouble();
    if (heightBox % 2 == 1) {
      heightBox = heightBox / 2 + 0.5;
    } else {
      heightBox = heightBox / 2;
    }
    return Container(
      padding: const EdgeInsets.all(2),
      constraints: BoxConstraints(maxHeight: (75 * heightBox)),
      child: StaggeredGridView.countBuilder(
        itemCount: topics.length,
        staggeredTileBuilder: (index) => const StaggeredTile.fit(2),
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          return BoxContent(
            content: topics[index].content,
            index: index,
            color: topics[index].level,
          );
        },
      ),
    );
  }
}
