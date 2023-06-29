import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:world_time/pages/home.dart';
import 'dart:convert';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = "Loading...";

  void setWorldTime()async{
    WorldTime instance = WorldTime(location: "Berlin", flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getDataFromApi();
    //Navigator.pushNamed(context, '/home'); //this will push home on top of loading
    Navigator.pushReplacementNamed(context, '/home',
      arguments: {
      'location':instance.location,
        'flag':instance.flag,
        'time':instance.time,
        'isDayTime':instance.isDayTime,
      });
    //this will
    //remove loading screen from bottom and push home on top
    print(instance.time);
    setState(() {
      time = instance.time;
    });
  }

  @override
  void initState() {
    super.initState();
    print("init state of choose location");
    setWorldTime();
    //getData();

  }

  void getData () async{
    print("get data runs");
    //const String apiEndpoint = 'https://tejtech.onrender.com/';
    const String apiEndpoint = 'https://jsonplaceholder.typicode.com/todos/1';

    final Uri url = Uri.parse(apiEndpoint);
    var response = await http.get(url);
    print(response.body);
    Map data = jsonDecode(response.body);
    print(data);
    print(data['userId']);
    print(data['title']);
    print(data['completed']);


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      )
    );
  }
}
