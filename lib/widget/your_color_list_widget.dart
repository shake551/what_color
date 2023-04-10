import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:what_color/domain/model/your_color.dart';

class YourColorListWidget extends StatelessWidget {
  YourColorListWidget({required this.feelList, super.key});

  final List<YourColor> feelList;
  final outputFormat = DateFormat('yyyy/MM/dd');

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
        return Row(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Color.fromRGBO(
                  feelList[index].color.r,
                  feelList[index].color.g,
                  feelList[index].color.b,
                  0.8,
                ),
                shape: BoxShape.circle,
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          feelList[index].comment,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          outputFormat.format(feelList[index].createdAt),
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
