import 'package:flutter/material.dart';
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = TextEditingController();
  TextEditingController _binaryController = TextEditingController();
  TextEditingController _decimalController = TextEditingController();
final textp=TextStyle(fontSize: 20,fontWeight: FontWeight.bold);
  final textb=TextStyle(fontSize: 35,fontWeight: FontWeight.bold);
String bin='';
String dec='';
  @override
  Widget build(BuildContext context) {
    final wdth=MediaQuery.of(context).size.width ;


    final hgt=MediaQuery.of(context).size.height ;
    return Scaffold(
      appBar: AppBar(

        title: Center(child: Text(widget.title)),
      ),
      body: Container(
        child:Column(
          children: [

            Text("Binary:",style: textp,),
            SizedBox(height: hgt*0.01,
              width: double.infinity,
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white70,
                  border: Border.all(
                      color: Colors.teal[800],// set border color
                      width: 3.0),   // set border width
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.0)), // set rounded corner radius
                 // boxShadow: [BoxShadow(blurRadius: 10,color: Colors.black,offset: Offset(1,3))]// make rounded corner of border
              ),

              child: Text("$bin",style:textp ,),
            ),
            SizedBox(height: hgt*0.01,
              width: double.infinity,
            ),
            Text("   Decimal:",style: textp,),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white70,
                border: Border.all(
                    color: Colors.teal[800],// set border color
                    width: 3.0),   // set border width
                borderRadius: BorderRadius.all(
                    Radius.circular(10.0)), // set rounded corner radius
                // boxShadow: [BoxShadow(blurRadius: 10,color: Colors.black,offset: Offset(1,3))]// make rounded corner of border
              ),

              child: Text("$dec",style:textp ,),

            ),
            SizedBox(height: hgt*0.03,
              width: double.infinity,
            ),
           Row(
             children: [
               Expanded(
                 child: Padding(
                   padding: const EdgeInsets.all(16.0),
                   child: FlatButton(child:Text("0",style: textb,),
                   textColor: Colors.white,
                   color: Colors.teal,
                   onPressed: (){
                     setState(() {
                       bin=bin+'0';
                       print("$bin");
                     });
                   },
                   ),
                 ),
               ),
               SizedBox(width: wdth*0.01,

               ),
               Expanded( 
                 child: Padding(
                   padding: const EdgeInsets.all(16.0),
                   child: FlatButton(child:Text("1",style: textb,),
                     textColor: Colors.white,
                     color: Colors.teal,
                     onPressed: (){
                       setState(() {
                         bin=bin+'1';
                         print("$bin");
                       });
                     },
                   ),
                 ),
               ),

             ],
           ),
            SizedBox(height: hgt*0.05,
              width: double.infinity,
            ),
            FlatButton(
              onPressed: (){
               setState(() {
                 dec= int.parse(bin, radix: 2).toRadixString(10);
               });
              },
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white70,
                  border: Border.all(
                      color: Colors.teal[800],// set border color
                      width: 3.0),   // set border width
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.0)), // set rounded corner radius
                  // boxShadow: [BoxShadow(blurRadius: 10,color: Colors.black,offset: Offset(1,3))]// make rounded corner of border
                ),

                child: Text("Convert",style:textp),

              ),
            ),
            SizedBox(height: hgt*0.1,
              width: double.infinity,
            ),
           Row(children: [
             Expanded(
               child: FloatingActionButton(

                onPressed: (){
                  setState(() {
                    int l=bin.length;
                    if(l>0){
                      bin=bin.substring(0,l-1);
                      print(bin);
                    }

                  });
                },
                 child: Icon(Icons.backspace),
               ),
             ),
             Expanded(
               child: FloatingActionButton(
                  onPressed: (){
                    setState(() {
                      bin='';
                      dec='';
                    });
                  },

                 child: Icon(Icons.clear),
               ),
             ),
           ],),


          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
