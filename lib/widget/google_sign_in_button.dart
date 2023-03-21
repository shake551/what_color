import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:what_color/page/component/footer.dart';

class GoogleSignInButton extends StatefulWidget {
  const GoogleSignInButton({super.key});

  @override
  GoogleSignInButtonState createState() => GoogleSignInButtonState();
}

class GoogleSignInButtonState extends State<GoogleSignInButton> {
  static final googleLogin = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                elevation: MaterialStateProperty.all(16),
              ),
              onPressed: () async {
                final signinAccount = await googleLogin.signIn();
                if (signinAccount == null) return;
                final auth = await signinAccount.authentication;
                final credential = GoogleAuthProvider.credential(
                  idToken: auth.idToken,
                  accessToken: auth.accessToken,
                );
                // 認証情報をFirebaseに登録
                final user = (await FirebaseAuth.instance
                        .signInWithCredential(credential))
                    .user;
                // ignore: use_build_context_synchronously
                if (!context.mounted) return;
                if (user != null) {
                  unawaited(
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Footer(),
                      ),
                    ),
                  );
                }
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Image(
                      image: AssetImage('assets/google_logo.png'),
                      height: 35,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Sign in with Google',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
