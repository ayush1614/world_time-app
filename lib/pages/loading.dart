import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading';
  void setupWorldTime () async
  {
      WorldTime instance = WorldTime(location: 'Berlin' , flag: 'germany.png' , url: 'Europe/Berlin');
      await instance.getTime();

      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'daytime': instance.daytime,
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
      backgroundColor: Colors.lightBlue.shade800,
      body: Center(
        child: SpinKitPouringHourglass(
          size: 100.0,
          color: Colors.green.shade400,
          duration: const Duration(milliseconds: 1000),
        ),
      ),
    );
  }
}
