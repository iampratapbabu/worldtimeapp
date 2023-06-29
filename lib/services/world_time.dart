import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time = "";
  String flag;
  String url;
  bool isDayTime=false;

  WorldTime({
    required this.location,
    required this.flag,
    required this.url,
  });

  Future<void> getDataFromApi() async {
    try {
      print("get getDataFromApi runs");
      String apiEndpoint = 'http://worldtimeapi.org/api/timezone/$url';
      final Uri myUrl = Uri.parse(apiEndpoint);
      var response = await http.get(myUrl);
      //print(response.body);
      Map data = jsonDecode(response.body);

      //getting properties from data
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      //creating dateobject
      DateTime now = DateTime.parse(dateTime);
      now.add(Duration(hours: int.parse(offset)));

      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;

      //setting the time property
      //time = now.toString();
      //fomatting time using intl package
      time = DateFormat.jm().format(now);
      //print(time);
    } catch (e) {
      print("getDataFromApi [ERROR] ==> $e");
      time = "could not get time data";
    }
  }
}

WorldTime instance =
    WorldTime(location: "Berlin", flag: 'germany.png', url: 'Europe/Berlin');
