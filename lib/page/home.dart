import 'package:flutter/material.dart';
import 'package:what_color/page/navigate.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Navigate(),
    );
  }
}
