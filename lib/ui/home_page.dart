//imports
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //read json file method

  Future<void> readJsonFile() async {
    //data (read jsons data in String)
    final jsonData =
        await rootBundle.rootBundle.loadString('assets/json/data.json');
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
