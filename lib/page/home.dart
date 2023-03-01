import 'package:flutter/material.dart';
import 'package:what_color/page/navigate.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Navigate(),
    );
  }
}
