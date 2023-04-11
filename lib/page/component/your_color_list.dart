import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:what_color/domain/model/your_color.dart';
import 'package:what_color/domain/repository/your_color_repository.dart';
import 'package:what_color/widget/your_color_list_widget.dart';

class YourColorList extends StatefulWidget {
  const YourColorList({super.key});

  @override
  State<StatefulWidget> createState() => YourColorListState();
}

class YourColorListState extends State<YourColorList> {
  List<YourColor> feelList = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    setFeelList();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(),
            ],
          ),
        ),
      );
    }
    return YourColorListWidget(feelList: feelList);
  }

  Future<void> setFeelList() async {
    final yourColor = await YourColorRepository.getYourColorByUserID(
      FirebaseAuth.instance.currentUser!.uid,
    );

    setState(() {
      feelList = yourColor;
      isLoading = false;
    });
  }
}
