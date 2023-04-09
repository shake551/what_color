import 'package:flutter/material.dart';
import 'package:what_color/page/component/your_color_list.dart';
import 'package:what_color/page/navigate.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('What Color?'),
        ),
        body: Column(
          children: const [
            Expanded(
              child: YourColorList(),
            ),
            Navigate(),
          ],
        ),
      ),
    );
  }
}
