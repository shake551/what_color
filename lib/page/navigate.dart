import 'package:flutter/material.dart';
import 'package:what_color/page/color_select.dart';

class Navigate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('次へ'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ColorSelect()),
            );
          },
        ),
      ),
    );
  }

}