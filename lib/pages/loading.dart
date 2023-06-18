import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState() {
    super.initState();
    print("init state of choose location");
    getData();
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
      body: SafeArea(child: Text("Loading"),),
    );
  }
}
