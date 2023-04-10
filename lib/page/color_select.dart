import 'package:flutter/material.dart';
import 'package:what_color/domain/model/color_base.dart';
import 'package:what_color/page/feel_form.dart';

class ColorSelect extends StatefulWidget {
  const ColorSelect({super.key});

  @override
  State<StatefulWidget> createState() => ColorSelectState();
}

class ColorSelectState extends State<ColorSelect> {
  final colors = [
    const ColorBase(250, 120, 120),
    const ColorBase(250, 145, 120),
    const ColorBase(250, 170, 120),
    const ColorBase(250, 195, 120),
    const ColorBase(250, 220, 120),
    const ColorBase(250, 230, 120),
    const ColorBase(250, 250, 120),
    const ColorBase(225, 250, 120),
    const ColorBase(200, 250, 120),
    const ColorBase(175, 250, 120),
    const ColorBase(150, 250, 120),
    const ColorBase(135, 250, 120),
    const ColorBase(120, 250, 120),
    const ColorBase(120, 250, 134),
    const ColorBase(120, 250, 170),
    const ColorBase(120, 250, 195),
    const ColorBase(120, 250, 220),
    const ColorBase(120, 250, 230),
    const ColorBase(120, 250, 250),
    const ColorBase(120, 225, 250),
    const ColorBase(120, 200, 250),
    const ColorBase(120, 175, 250),
    const ColorBase(120, 150, 250),
    const ColorBase(120, 120, 250),
  ];

  List<ColorBase> selectedTags = <ColorBase>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('What Color?'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                crossAxisCount: 4,
                padding: const EdgeInsets.all(50),
                mainAxisSpacing: 30,
                crossAxisSpacing: 30,
                children: colors.map((color) {
                  // selectedTags の中に自分がいるかを確かめる
                  final isSelected = selectedTags.contains(color);
                  return InkWell(
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
                    child: Stack(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(color.r, color.g, color.b, 1),
                          ),
                        ),
                        Align(
                          child: isSelected
                              ? const Icon(
                                  Icons.check,
                                  weight: 1000,
                                )
                              : null,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: SizedBox(
              width: 80,
              height: 80,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  shape: const CircleBorder(),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          FeelForm(selectedColors: selectedTags),
                    ),
                  );
                },
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
