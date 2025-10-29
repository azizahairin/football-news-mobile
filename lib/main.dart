import 'package:flutter/material.dart';
import 'package:football_news/menu.dart'; // pastikan sama dengan name di pubspec.yaml

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football News',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(secondary: Colors.blueAccent[400]),
      ),
      home: MyHomePage(), // <-- tanpa const & tanpa title
      debugShowCheckedModeBanner: false,
    );
  }
}
