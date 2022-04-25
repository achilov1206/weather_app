import 'dart:convert';

import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String weatherStateName;
  final String weatherStateAbbr;
  final String created;
  final double minTemp;
  final double maxTemp;
  final double theTemp;
  final String title;
  final int woeid;
  final DateTime lastUpdated;
  Weather({
    required this.weatherStateName,
    required this.weatherStateAbbr,
    required this.created,
    required this.minTemp,
    required this.maxTemp,
    required this.theTemp,
    required this.title,
    required this.woeid,
    required this.lastUpdated,
  });
  factory Weather.initial() => Weather(
        weatherStateName: '',
        weatherStateAbbr: '',
        created: '',
        minTemp: 100,
        maxTemp: 100,
        theTemp: 100,
        title: '',
        woeid: -1,
        lastUpdated: DateTime(1970),
      );

  @override
  List<Object?> get props => [
        weatherStateName,
        weatherStateAbbr,
        created,
        minTemp,
        maxTemp,
        theTemp,
        title,
        woeid,
        lastUpdated,
      ];

  @override
  String toString() {
    return 'Weather(weatherStateName: $weatherStateName, weatherStateAbbr: $weatherStateAbbr, created: $created, minTemp: $minTemp, maxTemp: $maxTemp, theTemp: $theTemp, title: $title, woeid: $woeid, lastUpdated: $lastUpdated)';
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'weather_state_name': weatherStateName});
    result.addAll({'weather_state_abbr': weatherStateAbbr});
    result.addAll({'created': created});
    result.addAll({'min_temp': minTemp});
    result.addAll({'max_temp': maxTemp});
    result.addAll({'the_temp': theTemp});
    result.addAll({'title': title});
    result.addAll({'woeid': woeid});
    result.addAll({'last_updated': DateTime.now()});

    return result;
  }

  factory Weather.fromJson(Map<String, dynamic> json) {
    final consolidateWeather = json['consolidated_weather'][0];
    return Weather(
      weatherStateName: consolidateWeather['weather_state_name'] ?? '',
      weatherStateAbbr: consolidateWeather['weather_state_abbr'] ?? '',
      created: consolidateWeather['created'] ?? '',
      minTemp: consolidateWeather['min_temp']?.toDouble() ?? 0.0,
      maxTemp: consolidateWeather['max_temp']?.toDouble() ?? 0.0,
      theTemp: consolidateWeather['the_temp']?.toDouble() ?? 0.0,
      title: json['title'] ?? '',
      woeid: json['woeid']?.toInt() ?? 0,
      lastUpdated: DateTime.now(),
    );
  }

  String toJson() => json.encode(toMap());
}
