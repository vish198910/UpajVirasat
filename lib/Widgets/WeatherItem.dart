import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:upajVirasat/Models/Weatherdata.dart';

class Weather_1 extends StatelessWidget {
  final WeatherData weather;

  Weather_1({Key key, this.weather}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(weather.name, style: new TextStyle(color: Colors.black)),
        Text(weather.main,
            style: new TextStyle(color: Colors.black, fontSize: 32.0)),
        Text('${weather.temp.toString()}°C',
            style: new TextStyle(color: Colors.black)),
        Image.network('https://openweathermap.org/img/w/${weather.icon}.png'),
        Text(new DateFormat.yMMMd().format(weather.date),
            style: new TextStyle(color: Colors.black)),
        Text(new DateFormat.Hm().format(weather.date),
            style: new TextStyle(color: Colors.black)),
      ],
    );
  }
}

class WeatherItem extends StatelessWidget {
  final WeatherData weather;

  WeatherItem({Key key, @required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(weather.name, style: new TextStyle(color: Colors.black)),
            Text(weather.main,
                style: new TextStyle(color: Colors.black, fontSize: 24.0)),
            Text('${weather.temp.toString()}°C',
                style: new TextStyle(color: Colors.black)),
            Image.network(
                'https://openweathermap.org/img/w/${weather.icon}.png'),
            Text(new DateFormat.yMMMd().format(weather.date),
                style: new TextStyle(color: Colors.black)),
            Text(new DateFormat.Hm().format(weather.date),
                style: new TextStyle(color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
