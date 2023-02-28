import 'package:flutter/material.dart';

void main() {
  runApp(const ColorSelect());
}

class ColorSelect extends StatefulWidget {
  const ColorSelect({super.key});

  @override
  State<StatefulWidget> createState() => ColorSelectState();
}

class ColorSelectState extends State<ColorSelect> {
  final colors = [
    [250, 120, 120],
    [250, 145, 120],
    [250, 170, 120],
    [250, 195, 120],
    [250, 220, 120],
    [250, 230, 120],
    [250, 250, 120],
    [225, 250, 120],
    [200, 250, 120],
    [175, 250, 120],
    [150, 250, 120],
    [135, 250, 120],
    [120, 250, 120],
    [120, 250, 134],
    [120, 250, 170],
    [120, 250, 195],
    [120, 250, 220],
    [120, 250, 230],
    [120, 250, 250],
    [120, 225, 250],
    [120, 200, 250],
    [120, 175, 250],
    [120, 150, 250],
    [120, 120, 250],
  ];

  List<List<int>> selectedTags = <List<int>>[];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('複数選択できるタグ')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.count(
            crossAxisCount: 4,
            padding: const EdgeInsets.all(50),
            mainAxisSpacing: 30,
            crossAxisSpacing: 30,
            children: colors.map((color) {
              // selectedTags の中に自分がいるかを確かめる
              final isSelected = selectedTags.contains(color);
              return InkWell(
                radius: 5,
                // borderRadius: const BorderRadius.all(Radius.circular(32)),
                onTap: () {
                  if (isSelected) {
                    // すでに選択されていれば取り除く
                    selectedTags.remove(color);
                  } else {
                    // 選択されていなければ追加する
                    selectedTags.add(color);
                  }
                  setState(() {});
                },
                child: AnimatedContainer(
                  width: 5,
                  height: 5,
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: isSelected ? 10 : 1,
                      color: Color.fromRGBO(color[0], color[1], color[2], 1),
                    ),
                    color: Color.fromRGBO(color[0], color[1], color[2], 1),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
