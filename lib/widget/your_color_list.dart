import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:what_color/domain/model/your_color.dart';
import 'package:what_color/domain/repository/your_color_repository.dart';

class YourColorList extends StatefulWidget {
  const YourColorList({super.key});

  @override
  State<StatefulWidget> createState() => YourColorListState();
}

class YourColorListState extends State<YourColorList> {
  List<YourColor> feelList = [];
  final outputFormat = DateFormat('yyyy/MM/dd');

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
            color: Color.fromRGBO(
              feelList[index].color.r,
              feelList[index].color.g,
              feelList[index].color.b,
              0.8,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          // height: 50,
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Center(
                  child: Text(
                    feelList[index].comment,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    outputFormat.format(feelList[index].createdAt),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),
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
