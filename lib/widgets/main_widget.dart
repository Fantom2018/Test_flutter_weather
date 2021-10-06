import 'package:flutter/material.dart';
import 'weather_tile.dart';
//import 'package:html/dom.dart';
import 'package:html/dom_parsing.dart';
import 'package:html/parser.dart';

class MainWidget extends StatelessWidget{
  final String location;
  final String weather;
  final double temp;
  final double tempMin;
  final double tempMax;
  final double windSpeed;
  final int humidity;

  MainWidget({
    required this.location,
    required this.temp,
    required this.tempMax,
    required this.tempMin,
    required this.weather,
    required this.windSpeed,
    required this.humidity
});

  BuildContext? get context => null;
  @override
  Widget build (BuildContext) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context!).size.height /2,
          width: MediaQuery.of(context!).size.width,
          color: Color(0xfff1f1f1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Text(
                "${location.toString()}",
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  "${temp.toInt()} Deg",
                  style: TextStyle(
                      color: Colors.purple,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w900
                  ),
                ),
              ),
              Text(
                "High of ${tempMax.toInt().toString()}Deg, Low of ${tempMin.toInt().toString()}Deg",
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
                  WeatherTile(icon: Icons.thermostat_outlined, title: "Temperature", subtitle: "${temp.toInt().toString()}\u2103"),
                  WeatherTile(icon: Icons.filter_drama_outlined, title: "Weather", subtitle: "${weather.toString()}"),
                  WeatherTile(icon: Icons.wb_sunny, title: "Humidity", subtitle: "${humidity.toString()}%"),
                  WeatherTile(icon: Icons.waves_outlined, title: "Wind speed", subtitle: "${windSpeed.toInt().toString()} m/sec"),
                ],
              )
          ),
        ),

      ],
    );
  }
}