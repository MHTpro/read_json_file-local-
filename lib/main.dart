import 'package:flutter/material.dart';
import 'package:read_json_file/ui/home_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Read Json file',
      home: HomePage(),
    );
  }
}
