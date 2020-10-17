import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/mainPage.dart';

class Button extends StatefulWidget {
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  String buttonText = 'Start';
  String num = "00:00:00";
  Timer timer;
  final stopwatch = Stopwatch();

  void timeout() {
    new Timer(Duration(seconds: 1), calculation);
  }

  void calculation() {
    if (stopwatch.isRunning) {
      timeout();
    }
    setState(() {
      num = stopwatch.elapsed.inHours.toString().padLeft(2, "0") +
          ":" +
          (stopwatch.elapsed.inMinutes % 60).toString().padLeft(2, "0") +
          ":" +
          (stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, "0");
    });
  }

  void _startstopbutton() {
    setState(() {
      if (stopwatch.isRunning) {
        buttonText = 'start';
        stopwatch.stop();
      } else {
        buttonText = 'stop';
        stopwatch.start();
        timeout();
      }
    });
  }

  void resetstopbutton() {
    if (stopwatch.isRunning) {
      _startstopbutton();
    }
    setState(() {
      stopwatch.reset();
      calculation();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Text(
          'StopWatch',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 35,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.black12, //white10
                Colors.pink, //black54
              ],
            ),
          ),
        ),
        
        centerTitle: true,
        backgroundColor: Color(0xFF2D2F41),
      ),
      body: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //For Clock
              FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => MainPage()),
                      ));
                },
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/icons/images.png',
                      width: 50,
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Clock',
                      style: TextStyle(color: Colors.white60, fontSize: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),

              //For Timer
              FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => Button()),
                      ));
                },
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/icons/timerWork.jpeg',
                      width: 60,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Timer',
                      style: TextStyle(color: Colors.white60, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ],
          ),
          VerticalDivider(
            color: Colors.redAccent,
            width: 2,
          ),
          Container(
            padding: EdgeInsets.only(top: 80, left: 50),
            child: Column(
              children: <Widget>[
                Text(
                  num,
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 80),
                Row(
                  children: <Widget>[
                    Container(
                      width: 150,
                      height: 60,
                      child: RaisedButton(
                        onPressed: _startstopbutton,
                        child: Text(
                          buttonText,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        color: Colors.black54,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          side: BorderSide(color: Colors.white, width: 6),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 100),
                Row(
                  children: <Widget>[
                    Container(
                      width: 150,
                      height: 60,
                      child: RaisedButton(
                        onPressed: resetstopbutton,
                        child: Text(
                          'Reset',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          side: BorderSide(color: Colors.white, width: 6),
                        ),
                        color: Colors.black12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
