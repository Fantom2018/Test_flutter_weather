import 'package:flutter/material.dart';

void main () => runApp(
  MaterialApp(
    title: "Weate App",
    home: MyApp(),
  )
);

class MyApp extends StatefulWidget {
  @overrride
  State<StatefulWidget> createState () {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height /2,
            width: MediaQuery.of(context).size.width,
            color: Color(0xfff1f1f1),
            child: Column(
              children: [
                Text(
                  "Location",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900
                ),
                ),
                Padding(
                  padding: ,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}