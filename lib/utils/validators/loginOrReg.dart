import 'package:appecomm/features/authentication/screens/login/login.dart';
import 'package:appecomm/features/authentication/screens/signup/signup.dart';
import 'package:flutter/material.dart';

class LoginOrReg extends StatefulWidget {
  const LoginOrReg({super.key});

  @override
  State<LoginOrReg> createState() => _LoginOrRegState();
}

class _LoginOrRegState extends State<LoginOrReg> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginScreen(onTap: togglePages);
    } else {
      return SignUpScreen(onTap: togglePages);
    }
  }
}
