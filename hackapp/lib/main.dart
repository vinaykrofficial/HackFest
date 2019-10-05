import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> offset;
  bool _visible = true;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 1000));

    offset = Tween<Offset>(begin: Offset.zero, end: Offset(0.5, 0.0))
        .animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          RaisedButton(
            child: Text('Show / Hide'),
            onPressed: () {
              switch (controller.status) {
                case AnimationStatus.completed:
                  controller.reverse();
                  break;
                case AnimationStatus.dismissed:
                  controller.forward();
                  break;
                default:
              }

              _visible = !_visible;
              setState(() {
                
              });
            },
          ),
          Column(
            children: <Widget>[
              AnimatedOpacity(
                duration: const Duration(milliseconds: 250),
                opacity: _visible ? 1.0 : 0.0,
                            child: SlideTransition(
                  position: offset,
                  child: Padding(
                    padding: EdgeInsets.all(50.0),
                    child: Container(
                      height: 400,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        boxShadow: [BoxShadow(color: Colors.red, spreadRadius: 1, blurRadius: 10)],
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}