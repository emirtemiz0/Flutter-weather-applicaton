
import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



   void setupWorldTime () async {
    WorldTime example = WorldTime(location: 'Berlin',flag: 'germany.png',url: 'Europe/Berlin');
    await example.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'location': example.location,
      'flag': example.flag,
      'time':example.time,
      'isDayTime':example.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }
}
