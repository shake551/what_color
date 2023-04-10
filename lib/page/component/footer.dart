import 'package:flutter/material.dart';
import 'package:what_color/marker_cluster/color_map.dart';
import 'package:what_color/page/home.dart';
import 'package:what_color/page/my_page.dart';

class Footer extends StatefulWidget {
  const Footer({super.key, this.param = 1});

  final int param;

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  List<Widget> display = [
    const ColorMap(),
    const Home(),
    const MyPage(),
  ];

  late int selectedIndex = widget.param;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: display[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.place), label: 'マップ'),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'マイページ'),
        ],
        // フッター領域の影
        elevation: 0,

        currentIndex: selectedIndex,

        onTap: (int index) {
          selectedIndex = index;
          setState(() {});
        },
        // 選択中フッターメニューの色
        fixedColor: Colors.black,
      ),
    );
  }
}
