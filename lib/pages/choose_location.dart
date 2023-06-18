import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  int count = 0;

  @override
  void initState() {
    super.initState();
    print("init state of choose location");
    //getData();
    getData1();
    print("hello from init state");
  }

  void getData1 () async{

    //ye async function banaye hain isme jab tk await wala complete
    //nhi hoga tb tk next line pr nhi jayega

    String username  = await Future.delayed(Duration(seconds: 3),(){
      print("This is the 3 second  messages await");
      return "Tej Pratap";
    });

    Future.delayed(Duration(seconds: 2),(){
      print("veg , musician and egg collection");
    });

    print("my name is $username");
  }
  
  void getData(){

    //is function me jaise delay hai waise hi print kam krega
    //sbse pehle normal line print hoga then 2 second wala then 3 second wala

    Future.delayed(Duration(seconds: 3),(){
      print("This is the messages");
    });

    Future.delayed(Duration(seconds: 2),(){
      print("veg , musician and egg collection");
    });

    print("this is the normal line will print first");
  }

  @override
  Widget build(BuildContext context) {
    print("build context runs");
    return Scaffold(
     backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body:ElevatedButton(
        onPressed: () {
          setState(() {
            count +=1;
          });
        },
        child: Text('counter is $count'),
      ),
    );
  }
}
