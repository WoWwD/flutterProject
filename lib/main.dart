import 'package:flutter/material.dart';
import 'package:flutter_project/presentation/widgets/navigation_bar/my_nav_bar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      home: const MyNavBar()
    );
  }
}
