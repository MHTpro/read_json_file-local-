//imports
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:flutter/services.dart' as rootbundle;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //read json file method

  Future readJsonFile() async {
    //read jsons data in String
    final jsonData =
        await rootbundle.rootBundle.loadString('assets/json/data.json');

    //convert String to map
    final data = json.decode(jsonData);

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //show data
              FutureBuilder(
                future: readJsonFile(),
                builder: (BuildContext context, snapshot) {
                  if (!(snapshot.hasData)) {
                    return const CircularProgressIndicator();
                  } else {
                    return Column(
                      children: <Widget>[
                        Text("Name: ${snapshot.data['name']}"),
                        Text("Age: ${snapshot.data['age']}"),
                        Text("Skills: ${snapshot.data['skills'].join(' - ')}"),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
