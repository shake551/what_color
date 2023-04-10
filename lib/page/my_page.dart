import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:what_color/page/component/calendar.dart';

class MyPage extends StatefulWidget {
  const MyPage({
    super.key,
  });

  @override
  State<MyPage> createState() => MyPageState();
}

class MyPageState extends State<MyPage> {
  String photoURL = '';
  String name = '';
  String email = '';

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        if (kDebugMode) {
          print(user.photoURL);
        }
        photoURL = user.photoURL!;
        name = user.displayName!;
        email = user.email!;
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('What Color?'),
        automaticallyImplyLeading: false,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: const EdgeInsetsDirectional.symmetric(horizontal: 30),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      photoURL,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: const Calendar(),
    );
  }
}
