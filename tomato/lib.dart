import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_controller.dart';

import 'package:timer_count_down/timer_count_down.dart';

void main() => runApp(MyApp());

///
/// Test app
///
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pomodoro',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(
        title: 'Pomodoro',
      ),
    );
  }
}

///
/// Home page
///
class MyHomePage extends StatefulWidget {
  ///
  /// AppBar title
  ///
  final String title;

  MyHomePage({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

///
/// Page state
///
class _MyHomePageState extends State<MyHomePage> {
  final CountdownController controller = CountdownController();

  bool _isPause = true;
  bool _isRestart = false;

  @override
  Widget build(BuildContext context) {
    final IconData buttonIcon = _isRestart
        ? Icons.refresh
        : (_isPause ? Icons.pause : Icons.play_arrow);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            widget.title,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.yellow, Colors.deepOrange])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Countdown(
                controller: controller,
                seconds: 25 * 60,
                build: (_, double time) {
                  double sec = time % 60;
                  double minutes = (time / 60);

                  return Text(
                    minutes.toInt().toString().padLeft(2, "0") +
                        ":" +
                        sec.toInt().toString().padLeft(2, "0"),
                    style: TextStyle(
                      fontSize: 100,fontFamily: 'DigitalDisplayRegular',
                    ),
                  );
                },
                interval: Duration(milliseconds: 1000),
                onFinished: () {
                  print('Timer is done!');

                  setState(() {
                    _isRestart = true;
                  });
                },
              ),
              FloatingActionButton(
                child: Icon(buttonIcon),
                onPressed: () {
                  final isCompleted = controller.isCompleted;
                  isCompleted ? controller.restart() : controller.pause();

                  if (!isCompleted && !_isPause) {
                    controller.resume();
                  }

                  if (isCompleted) {
                    setState(() {
                      _isRestart = false;
                    });
                  } else {
                    setState(() {
                      _isPause = !_isPause;
                    });
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
