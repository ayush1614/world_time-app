import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String? time;         // location name for the UI
  String? location;     // the time in that location
  String? url;          // url to an asset flag icon
  String? flag;         // location url of api endpoint
  bool? daytime;        // checks whether time is daytime or nightTime
  WorldTime({this.location , this.flag , this.url});

  Future<void> getTime() async
  {
    try {
      // MAKE THE REQUEST
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      //get properties from json
      String datetime = data['datetime'];
      String offset1 = data['utc_offset'].substring(1, 3);   //for hour
      String offset2 = data['utc_offset'].substring(4, 6);   // for minutes

      // set the time property
      DateTime now = DateTime.parse('$datetime');
      now = now.add(Duration( hours: int.parse(offset1) , minutes:int.parse(offset2)));
      print('now:$now');
      // set the time property
      daytime = now.hour>=6 && now.hour<=18 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch (e) {
      print("error is : $e");
      time = 'couldn\'t get data';
    }
  }
}