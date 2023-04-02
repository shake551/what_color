import 'package:flutter/material.dart';
import 'package:what_color/domain/model/color_base.dart';
import 'package:what_color/domain/model/your_color.dart';

class YourColorList extends StatefulWidget {
  const YourColorList({super.key});

  @override
  State<StatefulWidget> createState() => YourColorListState();
}

class YourColorListState extends State<YourColorList> {
  final feelList = [
    const YourColor('hoge', 'test', 1, 1, ColorBase(120, 250, 250)),
    const YourColor('hoge', 'test', 1, 1, ColorBase(120, 250, 250)),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: feelList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 50,
          child: Center(child: Text(feelList[index].comment)),
        );
      },
    );
  }
}
