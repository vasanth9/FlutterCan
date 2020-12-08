import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextStyle _subtext = TextStyle(
    color: Colors.grey,
    fontSize: 20,
  );

  final TextStyle _maintext = TextStyle(color: Colors.black, fontSize: 60);
  final TextStyle _maintext2 = TextStyle(color: Colors.black, fontSize: 40);
  final TextStyle _maintext3 = TextStyle(color: Colors.black, fontSize: 30);
  String oldtext = "";
  String newtext = "";
  String compute = "";

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    var _height = screenSize.height;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: _height * 4.6 / 10,
              child: Column(
                children: [
                  Container(
                    height: _height * 3 / 30,
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: SingleChildScrollView(
                        child: Text(
                          "$oldtext",
                          style: _subtext,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: _height * 6.99 / 20,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: SingleChildScrollView(
                        child: Text(
                          "$newtext",
                          style: newtext.length > 12
                              ? newtext.length < 16 ? _maintext2 : _maintext3
                              : _maintext,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: _height / 2,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RowBuild("C", "(", ")", "←", Colors.grey, Colors.grey),
                    RowBuild("7", "8", "9", "/", Colors.black87,
                        Colors.purpleAccent),
                    RowBuild("4", "5", "6", "*", Colors.black87,
                        Colors.orangeAccent),
                    RowBuild(
                        "1", "2", "3", "-", Colors.black87, Colors.redAccent),
                    RowBuild(
                        ".", "0", "=", "+", Colors.black87, Colors.greenAccent)
                  ]),
            )
          ],
        ),
      ),
    );
  }

  Widget RowBuild(
      String a, String b, String c, String d, Color color1, Color color2) {
    TextStyle style1 = TextStyle(fontSize: 30, color: color1);
    TextStyle style2 = TextStyle(fontSize: 40, color: color2);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FlatButton(
            onPressed: () {
              setState(() {
                if (a == "C") {
                  if (newtext.length == 0) {
                    oldtext = "";
                  }
                  newtext = "";
                } else {
                  newtext += "$a";
                }
              });
            },
            child: Text(
              "$a",
              style: style1,
            )),
        FlatButton(
            onPressed: () {
              setState(() {
                newtext += "$b";
              });
            },
            child: Text(
              "$b",
              style: style1,
            )),
        FlatButton(
            onPressed: () {
              setState(() {
                if (c == "=") {
                  Parser p = Parser();
                  Expression exp = p.parse(newtext);
                  ContextModel cm = ContextModel();
                  print(exp); // = ((x * 1.0) - -(5.0))
                  try {
                    var result = exp.evaluate(EvaluationType.REAL, cm);
                    print(result);

                    oldtext = newtext;
                    newtext = result.toString();
                  } catch (e) {
                    print("throwing new error");
                    throw Exception("Error on server");
                  }
                } else {
                  newtext += "$c";
                }
              });
            },
            child: Text(
              "$c",
              style: style1,
            )),
        FlatButton(
            onPressed: () {
              setState(() {
                if (d == "←") {
                  var l = newtext.length;
                  if (l > 0) {
                    newtext = newtext.substring(0, l - 1);
                  }
                } else {
                  newtext += "$d";
                }
              });
            },
            child: Text(
              "$d",
              style: style2,
            )),
      ],
    );
  }
}
