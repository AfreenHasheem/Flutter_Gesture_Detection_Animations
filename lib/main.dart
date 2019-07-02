import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestures and Animations',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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

 int numTaps = 0;
 int numDoubleTaps = 0;
 int numLongPress = 0;
 double posX = 0.0;
 double posY = 0.0;
 double boxSize = 150.0; //this is the width and height of the square



  @override
  Widget build(BuildContext context) {
    if(posX == 0.0){
      center(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Gestures and Animations"),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            left: posX,
            top: posY,
            child: Container(
              width: boxSize,
              height: boxSize,
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Material(
        color: Theme.of(context).primaryColorLight,
        child: Padding(
            padding: EdgeInsets.all(15.0),
              child: Text("Taps: $numTaps - DoubleTaps: $numDoubleTaps - Long Presses: $numLongPress",
              style: Theme.of(context).textTheme.title,),
        ),
      ),
    );
  }

  void center(BuildContext context){
    posX = (MediaQuery.of(context).size.width / 2) - boxSize /2;
    posY = (MediaQuery.of(context).size.height / 2) - boxSize /2 - 30.0;
    setState(() {
      posX = posX;
      posY = posY;
    });
  }

}
