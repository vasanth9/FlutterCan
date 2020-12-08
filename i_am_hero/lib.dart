import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
 home:
       Scaffold(
         appBar: AppBar(title:Text('I AM HERO') ,
           backgroundColor:Colors.red,
           centerTitle:true ,

         ),
         body:
           Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[

               Image(
                 height:200.0,
                 width: double.infinity,
                 image:AssetImage('images/rdj.jpg'),
               ),
               Image(
                 height:200.0,
                 width: double.infinity,
                 image:AssetImage('images/eleven.jpg'),
               ),
               Image(
                 width: double.infinity,
                 height:200.0,
                 image:AssetImage('images/hannah.jpeg'),
               ),

             ],
           )

           ),
       );


  }
}
