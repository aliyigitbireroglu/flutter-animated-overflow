//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  © Cosmos Software | Ali Yigit Bireroglu                                                                                                          /
//  All material used in the making of this code, project, program, application, software et cetera (the "Intellectual Property")                    /
//  belongs completely and solely to Ali Yigit Bireroglu. This includes but is not limited to the source code, the multimedia and                    /
//  other asset files.                                                                                                                               /
//  If you were granted this Intellectual Property for personal use, you are obligated to include this copyright text at all times.                  /
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:animated_overflow/animated_overflow.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Overflow Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'Animated Overflow Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF29292A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B1D1E),
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints: const BoxConstraints.expand(height: 20.0),
          ),
          Center(
            child: AnimatedOverflow(
              animatedOverflowDirection: AnimatedOverflowDirection.HORIZONTAL,
              child: const Text(
                "The quick brown fox jumps over the lazy dog.",
                style: const TextStyle(color: Colors.blue, fontSize: 15, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.visible,
              ),
              maxWidth: _width / 2.0,
              padding: 40.0,
              speed: 50.0,
            ),
          ),
          Container(
            constraints: const BoxConstraints.expand(height: 20.0),
          ),
          AnimatedOverflow(
            animatedOverflowDirection: AnimatedOverflowDirection.HORIZONTAL,
            child: const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
              style: const TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.visible,
            ),
            maxWidth: _width / 2.0 * 3.0,
            padding: 60.0,
            speed: 100.0,
          ),
          AnimatedOverflow(
            animatedOverflowDirection: AnimatedOverflowDirection.HORIZONTAL,
            child: const Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
              style: const TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.visible,
            ),
            maxWidth: _width / 2.0 * 3.0,
            padding: 60.0,
            speed: 50.0,
          ),
          Container(
            constraints: const BoxConstraints.expand(height: 20.0),
          ),
          AnimatedOverflow(
            animatedOverflowDirection: AnimatedOverflowDirection.VERTICAL,
            child: FlutterLogo(
              size: _width,
            ),
            maxHeight: 200,
            padding: 20.0,
            speed: 150.0,
          ),
          Container(
            constraints: const BoxConstraints.expand(height: 20.0),
          ),
          AnimatedOverflow(
            animatedOverflowDirection: AnimatedOverflowDirection.HORIZONTAL,
            child: const Text(
              "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
              style: const TextStyle(color: Colors.red, fontSize: 25, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.visible,
            ),
            maxWidth: _width,
            padding: 80.0,
            speed: 200.0,
          ),
          AnimatedOverflow(
            animatedOverflowDirection: AnimatedOverflowDirection.HORIZONTAL,
            child: const Text(
              "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
              style: const TextStyle(color: Colors.red, fontSize: 25, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.visible,
            ),
            maxWidth: _width,
            padding: 80.0,
            speed: 150.0,
          ),
          Row(
            children: [
              AnimatedOverflow(
                animatedOverflowDirection: AnimatedOverflowDirection.VERTICAL,
                child: FlutterLogo(
                  size: _width / 2.0,
                ),
                maxHeight: 100,
                padding: 20.0,
                speed: 50.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedOverflow(
                    animatedOverflowDirection: AnimatedOverflowDirection.VERTICAL,
                    child: FlutterLogo(
                      size: _width / 2.0,
                    ),
                    maxHeight: 50,
                    padding: 20.0,
                    speed: 200.0,
                  ),
                  AnimatedOverflow(
                    animatedOverflowDirection: AnimatedOverflowDirection.HORIZONTAL,
                    child: const FlutterLogo(
                      size: 50,
                    ),
                    maxWidth: _width / 2.0,
                    padding: 20.0,
                    speed: 200.0,
                  ),
                ],
              ),
            ],
          ),
          AnimatedOverflow(
            animatedOverflowDirection: AnimatedOverflowDirection.HORIZONTAL,
            child: const Text(
              "Cosmos Software",
              style: const TextStyle(color: Colors.white, fontSize: 75, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.visible,
            ),
            maxWidth: _width,
            padding: 10.0,
            speed: 50.0,
          ),
          AnimatedOverflow(
            animatedOverflowDirection: AnimatedOverflowDirection.HORIZONTAL,
            child: Container(
              width: _width * 2.0,
              height: 200.0,
              decoration: const BoxDecoration(
                image: const DecorationImage(
                  image: const AssetImage(
                    "assets/panoramic.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            maxWidth: _width,
            padding: 0.0,
            speed: 50.0,
          ),
        ],
      ),
    );
  }
}
