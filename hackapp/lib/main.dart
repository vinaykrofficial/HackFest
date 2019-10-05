import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(home: HackApp(),));
}

class HackApp extends StatefulWidget {
  @override
  _HackAppState createState() => _HackAppState();
}

class _HackAppState extends State<HackApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text("HacktoberFest 2019"),
        backgroundColor: Colors.purpleAccent,
      ),
    body: Center(
      child: SizedBox(
        height: 100,
        child: new Card(
          color: Colors.purpleAccent,
          elevation: 10,
          child: Center(child: new Text("Make 4 PR's and get swags")),
        ),
      ),
    ),
    );
  }
}