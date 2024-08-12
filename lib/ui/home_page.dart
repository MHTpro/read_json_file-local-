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
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Read json file',
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
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
                    //data
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Name: ${snapshot.data['name']}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Age: ${snapshot.data['age']}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Skills: ${snapshot.data['skills'].join(' - ')}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
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
