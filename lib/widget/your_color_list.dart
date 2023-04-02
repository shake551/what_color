import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:what_color/domain/model/your_color.dart';
import 'package:what_color/domain/repository/your_color_repository.dart';

class YourColorList extends StatefulWidget {
  const YourColorList({super.key});

  @override
  State<StatefulWidget> createState() => YourColorListState();
}

class YourColorListState extends State<YourColorList> {
  List<YourColor> feelList = [];

  @override
  void initState() {
    super.initState();

    setFeelList();
  }

  @override
  Widget build(BuildContext context) {
    if (feelList.isEmpty) {
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
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: feelList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 50,
          child: Center(child: Text(feelList[index].comment)),
        );
      },
    );
  }

  Future<void> setFeelList() async {
    final yourColor = await YourColorRepository.getYourColorByUserID(
      FirebaseAuth.instance.currentUser!.uid,
    );

    setState(() {
      feelList = yourColor;
    });
  }
}
