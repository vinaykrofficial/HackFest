import 'package:flutter/material.dart';
import 'src/basics/01_animated_container.dart';
import 'src/basics/02_page_route_builder.dart';
import 'src/basics/03_animation_controller.dart';
import 'src/basics/04_tweens.dart';
import 'src/basics/05_animated_builder.dart';
import 'src/basics/06_custom_tween.dart';
import 'src/basics/07_tween_sequence.dart';
import 'src/basics/08_fade_transition.dart';
import 'src/misc/animated_list.dart';
import 'src/misc/animated_positioned.dart';
import 'src/misc/animated_switcher.dart';
import 'src/misc/card_swipe.dart';
import 'src/misc/carousel.dart';
import 'src/misc/curved_animation.dart';
import 'src/misc/expand_card.dart';
import 'src/misc/focus_image.dart';
import 'src/misc/hero_animation.dart';
import 'src/misc/physics_card_drag.dart';
import 'src/misc/repeating_animation.dart';

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

final basicDemoRoutes =
    Map.fromEntries(basicDemos.map((d) => MapEntry(d.route, d.builder)));

final miscDemoRoutes =
    Map.fromEntries(miscDemos.map((d) => MapEntry(d.route, d.builder)));

final allRoutes = <String, WidgetBuilder>{
  ...basicDemoRoutes,
  ...miscDemoRoutes,
};

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> offset;
  bool _visible = true;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

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
              setState(() {});
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
                          boxShadow: [
                            BoxShadow(
                                color: Colors.red,
                                spreadRadius: 1,
                                blurRadius: 10)
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(20))),
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
