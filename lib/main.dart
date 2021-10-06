import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/weather_tile.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<WeatherInfo> fetcWeather() async{
  final zipCode = "125464" ;
  final apiKey = ;
  final requestUrl = "http://api.openweathermap.org/data/2.5/weather?zip=${zipCode},ru&appid=${apiKey}";

  final response = await http.get(Url.parse(requestUrl));
  if (response.statusCode == 200){
    return WeatherInfo.fromJson(jsonDecode(response.body));
  }else{
    throw Exeption("Eroor loading request URL info.")
  }
}

class WeatherInfo {
  final String location;
  final String weather;
  final double temp;
  final double tempMin;
  final double tempMax;
  final double windSpeed;
  final int humidity;

  WeatherInfo({
    @required this.location,
    @required this.temp,
    @required this.tempMax,
    @required this.tempMin,
    @required this.weather,
    @required this.windSpeed,
    @required this.humidity
})
  factory WeatherInfo.formJson(Map<String.dynamic> json){
    return WeatherInfo(
        location: json['name'],
        temp: json['main']['temp'],
        tempMax: json['main']['temp_max'],
        tempMin: json['main']['temp_min'],
        weather: json['weaser'][0]['description'],
        windSpeed: json['wind']['speed'],
        humidity: json['main']['humidity']
    );
  }
}


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

  late Future<WeatherInfo> futureWeather;

    @override
  void initSate(){
    super.initState();
    futureWeaser = fetcWeather();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      body:FutureBuilder<WeatherInfo>(
        future: futureWeather,
        builder: (context, snapshot){
          if(snapshot.hasData){

      }else if(snapshot.hasError){
        return Center(
          child: Text("${snapshot.hasError}"),
        );
      }
      }
      )
    );
}