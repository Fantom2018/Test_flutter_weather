
import 'widgets/main_widget.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<WeatherInfo> fetchWeather() async{
  const zipCode = "125222" ;
  final apiKey = "ad9fxxxxxxxxxxxxxx6816d37";
  const String requestUrl = "http://api.openweathermap.org/data/2.5/weather?zip=${zipCode},ru&appid=${apiKey}";

  var Url;
  final response = await http.get(Url.parse(requestUrl));
  if (response.statusCode == 200){
    return WeatherInfo.fromJson(jsonDecode(response.body));
  }else{
    throw Exception("Error loading request URL info.");
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
    required this.location,
    required this.temp,
    required this.tempMax,
    required this.tempMin,
    required this.weather,
    required this.windSpeed,
    required this.humidity
});
  factory WeatherInfo.fromJson(Map<String, dynamic> json){
    return WeatherInfo(
        location: json['name'],
        temp: json['main']['temp'],
        tempMax: json['main']['temp_max'],
        tempMin: json['main']['temp_min'],
        weather: json['weather'][0]['description'],
        windSpeed: json['wind']['speed'],
        humidity: json['main']['humidity']
    );
  }
}


void main () => runApp(
  const MaterialApp(
    title: "Weather App",
    home: MyApp(),
  )
);

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState () => _MyApp();
}

class _MyApp extends State<MyApp>{

  late Future<WeatherInfo> futureWeather;

    void initSate(){
    super.initState();
    futureWeather = fetchWeather();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      body:FutureBuilder<WeatherInfo>(
        future: futureWeather,
          builder: (BuildContext context, snapshot){
          if(snapshot.hasData){
            return MainWidget(
              location: snapshot.data!.location,
              weather: snapshot.data!.weather,
              windSpeed: snapshot.data!.windSpeed,
              temp: snapshot.data!.temp,
              tempMin: snapshot.data!.tempMin,
              tempMax: snapshot.data!.tempMax,
              humidity: snapshot.data!.humidity

            );
      }else {
        return const Center(
          child:Text ("error"),
        );
      }
      }
      )
    );
}