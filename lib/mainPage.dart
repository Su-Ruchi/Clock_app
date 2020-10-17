
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:flutter_app/Button.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int seconds = 00;
  Timer timer;

  void initState() {
    var now = DateTime.now();
    seconds = (((23 - now.hour) * 3600) +
        ((59 - now.minute) * 60) +
        (59 - now.second));
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (seconds != 0)
          seconds--;
        else {
          var now = DateTime.now();
          seconds = (((23 - now.hour) * 3600) +
              ((59 - now.minute) * 60) +
              (59 - now.second));
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    String formattedDate = DateFormat('hh:mm:ss a').format(now);
    String formattedTime = DateFormat.yMMMd().format(now);
    return Scaffold(

      backgroundColor: Colors.black,
      body: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              //For Clock
              FlatButton(
                onPressed: () {
//                  Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                        builder: ((context) => MainPage()),
//                      ));
                setState(() {
                  return MainPage();
                });
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
                      Navigator.pushReplacement(
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
            color: Colors.white,
            width: 2,
          ),

          //left side work
          Container(
            padding: EdgeInsets.only(top: 50),
            child: Column(
              children: <Widget>[
                //Clock[BoxDecoration]
                Row(
                  children: <Widget>[
                    Container(
                      width: 190,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            offset: Offset(5.0, 5.0),
                            color: Colors.pink,
                            blurRadius: 40.0,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Container(
                          child: Text(
                            'Clock',
                            style: TextStyle(
                              fontSize: 45,
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                //Time
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 100.0),
                      child: Text(
                        formattedDate,
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),

                //Date
                Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        formattedTime,
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),

                //Seconds
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(right: 50, top: 50),
                      child: Text(
                        'Seconds',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ],
                ),

                //SecondsCalculate
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(right: 45),
                      child: Text(
                        '$seconds',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                        ),
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
