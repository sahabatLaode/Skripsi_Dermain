import 'package:dermain/Authentication/sign_in.dart';
import 'package:dermain/Authentication/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SIgnInController extends StatelessWidget {
  const SIgnInController({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const SignUp();
          } else {
            return const SignIn();
          }
        },
      ),
    );
  }
}
