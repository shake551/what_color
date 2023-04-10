import 'package:flutter/material.dart';
import 'package:what_color/page/color_select.dart';

class Navigate extends StatelessWidget {
  const Navigate({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
        ),
        child: const Text(
          '次へ',
          style: TextStyle(color: Colors.grey),
        ),
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
