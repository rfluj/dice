import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in a Flutter IDE). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with  SingleTickerProviderStateMixin {
  // var random = new Random();
  int pnumber1 = Random().nextInt(6) + 1;
  int pnumber2 = Random().nextInt(6) + 1;
  int number1  = Random().nextInt(6) + 1;
  int number2  = Random().nextInt(6) + 1;
  late Animation<int> animation;
  late AnimationController controller ;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
    animation = IntTween(begin: 0, end: 100).animate(controller);
    controller.addListener(() {
      if (controller.isCompleted){
        controller.reset();
      }
      // print(animation.value);

      if (animation.value >= 50) {
        pnumber1 = number1;
        pnumber2 = number2;
      }
    });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : GestureDetector(
        onTap:(){
          setState(() {
            number1 = Random().nextInt(6) + 1;
            number2 = Random().nextInt(6) + 1;
            if (controller.isCompleted) {
              controller.reset();
            }
            else {
              controller.forward();
            }
          });
        } ,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.1, 0.9],
              colors: [
                Colors.purple,
                // Colors.yellow,
                // Colors.yellow,
                Colors.grey,
              ],
            ),
          ),
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) => Stack(
              children: [
                Column(children: [
                  Container(
                    padding: EdgeInsets.only(right: MediaQuery.of(context).size.width/5),
                    height: MediaQuery.of(context).size.height/2,
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.grey,
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: MediaQuery.of(context).size.width/4,
                      child: Center(
                          child: Image.asset('assets/Images/${animation.value >= 50 ? number1 : pnumber1}.png', color: Colors.black54, width: animation.value >= 50 ? MediaQuery.of(context).size.width/4*(animation.value-50)/50 : MediaQuery.of(context).size.width/4*(50-animation.value)/50, height: animation.value >= 50 ? MediaQuery.of(context).size.width/4*(animation.value-50)/50 : MediaQuery.of(context).size.width/4*(50-animation.value)/50)
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width/5),
                    height: MediaQuery.of(context).size.height/2,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.centerLeft,
                    child: Container(
                      color: Colors.white.withOpacity(0.1),
                      width: MediaQuery.of(context).size.width/4,
                      child: Center(
                          child: Image.asset('assets/Images/${animation.value >= 50 ? number2 : pnumber2}.png', color: Colors.black54, width: animation.value >= 50 ? MediaQuery.of(context).size.width/4*(animation.value-50)/50 : MediaQuery.of(context).size.width/4*(50-animation.value)/50, height: animation.value >= 50 ? MediaQuery.of(context).size.width/4*(animation.value-50)/50 : MediaQuery.of(context).size.width/4*(50-animation.value)/50)
                      ),
                    ),
                  )
                ],),
                Center(
                  child: Container(
                    width: 50,
                    height: 50,
                    child: Center(
                      child: Text('${animation.value >= 50 ? number1 + number2 : pnumber1 + pnumber2}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          // backgroundColor: Colors.white,
                          color: Colors.amber,
                          fontSize: animation.value >= 50 ? (animation.value-50)/2 : -1*(animation.value-50)/2,)
                      ),
                    ),
                    decoration: new BoxDecoration (
                        borderRadius: new BorderRadius.all(new Radius.circular(100.100)),
                        color: Colors.white
                    ),
                  )
                )],
            ),
          ),
        ),
      )
    );
  }
}

class Dice extends StatefulWidget {
  Dice(this.number);
  final int number;
  @override
  State<StatefulWidget> createState() {
    return DiceState(number);
  }
  
}

class DiceState extends State<Dice> {
  DiceState(this.number);
  final int number;
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/Images/$number.png');
  }
  
}


