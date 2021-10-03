import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main () => runApp(
  MaterialApp(
    title: "Weate App",
    home: MyApp(),
  )
);

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState () => _MyApp();
}

class _MyApp extends State<MyApp>{
  @override
  Widget build(BuildContext context) => Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height /2,
            width: MediaQuery.of(context).size.width,
            color: Color(0xfff1f1f1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Location",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900
                ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Text(
                    "Temperature",
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w900
                    ),
                  ),
                ),
                Text(
                  "High of temp, Low of temp",
                  style: TextStyle(
                    color: Color(0xff9e9e9e),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20.0),
                child: ListView(
                  children: [
                    ListTile(
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.thermostat_outlined, color: Colors.blueAccent,)
                        ],
                      ),
                      title: Text(
                        "Tmperature",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      subtitle: Text(
                        "SubTitle",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff9e9e9e)
                        ),
                      ),
                    )
                  ],
                )
              ),
            ),

        ],
      ),
    );
}