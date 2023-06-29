import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  dynamic myData;
  Map timeData = {};
  @override
  Widget build(BuildContext context) {
    myData =  ModalRoute.of(context)?.settings.arguments;
    print("data from another argument $myData");
    timeData = myData;
    String bgImage = timeData['isDayTime'] ? 'day.png' : 'night.png';
    Color? bgColor = timeData['isDayTime'] ? Colors.blue : Colors.indigo[700];
    print("bgimage $bgImage");

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assests/$bgImage'),
                fit:BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,120,0,0),
              child: Column(
        children: [
              TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/location');
                },
                icon: Icon(Icons.edit_location),
                label: Text("Edit Location"),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    timeData['location'],
                    style: const TextStyle(
                      fontSize: 20.0,
                      letterSpacing: 2.0,
                      color: Colors.white
                    ),
                  ),

                ],
              ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  timeData['time'],
                  style:const TextStyle(
                      fontSize: 50.0,
                      letterSpacing: 2.0,
                    color: Colors.white,
                  ),
                ),

              ],
            ),

        ],
      ),
            ),
          )),
    );
  }
}
