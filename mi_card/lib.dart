import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/vasanth.jpg'),
              ),
              Text(
                'Vasanth Kumar',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                ),
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                  fontFamily: 'SourceSanPro',
                  color: Colors.teal.shade900,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  letterSpacing: 2.5,
                ),
              ),
              new SizedBox(
                height: 10.0,
                child: new Center(
                  child: new Container(
                    margin:
                        new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                    height: 2.0,
                    color: Colors.teal.shade900,
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.teal,
                    ),
                    title: Text(
                      '+91 911 911 911 9',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.teal.shade900,
                        fontFamily: 'SourceSansPro',
                      ),
                    )),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                child: ListTile(
                    leading: Icon(
                      Icons.email,
                      color: Colors.teal,
                    ),
                    title: Text(
                      'newonenewone@newone.com',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.teal.shade900,
                        fontFamily: 'SourceSansPro',
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
