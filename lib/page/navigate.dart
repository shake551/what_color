import 'package:flutter/material.dart';
import 'package:what_color/page/color_select.dart';

class Navigate extends StatelessWidget {
  const Navigate({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: const Text('次へ'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ColorSelect()),
          );
        },
      ),
    );
  }
}
