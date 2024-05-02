import 'package:hotelmanagement/main.dart';
import 'package:hotelmanagement/login.dart';
import 'package:flutter/material.dart';
import 'package:hotelmanagement/auth.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MyApp();
        } else {
          return const LoginPage();
        }
      },
    );
  }
}
