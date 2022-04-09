import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:africa_time/service/africa_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    AfricaTime instances = AfricaTime(
        location: 'Nigeria, Lagos', url: 'Africa/Lagos', flag: 'nigeria.jpg');

    await instances.getTime();

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': instances.location,
        'isDaytime': instances.isDaytime,
        'time': instances.time,
        'flag': instances.flag,
      });
    });
  }

  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Color(0xFFCAD5E2),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 300),
              child: Column(
                children: <Widget>[
                  SpinKitRotatingCircle(
                    color: Color(0xFF6A1B4D),
                    size: 50.0,
                  ),
                  SizedBox(height: 200),
                  Text(
                    'Loading...',
                    style: TextStyle(
                      fontSize: 25,
                      letterSpacing: 2.0,
                      color: Color(0xFF6A1B4D),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
