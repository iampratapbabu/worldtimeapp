import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  int count = 0;

  @override
  void initState() {
    super.initState();
    print("init state of choose location");
    //getData();
    getData1();
    print("hello from init state");
  }

  void updateTime(index) async {
    print('index got $index');
    WorldTime instance = locations[index];
    await instance.getDataFromApi();
    Navigator.pop(context,{
      'location':instance.location,
      'flag':instance.flag,
      'time':instance.time,
      'isDayTime':instance.isDayTime,
    });
  }

  void getData1() async {
    //ye async function banaye hain isme jab tk await wala complete
    //nhi hoga tb tk next line pr nhi jayega
    String username = await Future.delayed(Duration(seconds: 3), () {
      print("This is the 3 second  messages await");
      return "Tej Pratap";
    });
    Future.delayed(Duration(seconds: 2), () {
      print("veg , musician and egg collection");
    });
    print("my name is $username");
  }

  void getData() {
    //is function me jaise delay hai waise hi print kam krega
    //sbse pehle normal line print hoga then 2 second wala then 3 second wala

    Future.delayed(Duration(seconds: 3), () {
      print("This is the messages");
    });

    Future.delayed(Duration(seconds: 2), () {
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
        // body:ElevatedButton(
        //   onPressed: () {
        //     setState(() {
        //       count +=1;
        //     });
        //   },
        //   child: Text('counter is $count'),
        // ),
        body: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                child: Card(
                    child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assests/${locations[index].flag}'),
                  ),
                )),
              );
            }));
  }
}
