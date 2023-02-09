// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  // main
  final int dt;
  final double temp;
  final double temp_min;
  final double temp_max;
  final double pressure;
  final double sea_level;
  final double grnd_level;
  final int humidity;
  final double temp_kf;

  // weather
  final int id;
  final String main;
  final String description;
  final String icon;

  // clouds
  final int cloudsall;

  // wind
  final double windspeed;
  final double winddeg;

  // snow
  final double snow3h;

  // sys
  final String syspod;

  final DateTime dt_txt;

  const Weather({
    required this.dt,
    required this.temp,
    required this.temp_min,
    required this.temp_max,
    required this.pressure,
    required this.sea_level,
    required this.grnd_level,
    required this.humidity,
    required this.temp_kf,
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
    required this.cloudsall,
    required this.windspeed,
    required this.winddeg,
    required this.snow3h,
    required this.syspod,
    required this.dt_txt,
  });

  factory Weather.fromMap(Map<String, dynamic> data) => Weather(
        dt: data['dt'] ?? 00,
        temp: data['main']['temp'] ?? 0.0,
        temp_min: data['main']['temp_min'] ?? 0.0,
        temp_max: data['main']['temp_max'] ?? 0.0,
        pressure: data['main']['pressure'].toDouble() ?? 0.0,
        sea_level: data['main']['sea_level'] ?? 0.0,
        grnd_level: data['main']['grnd_level'].toDouble() ?? 0.0,
        humidity: data['main']['humidity'] ?? 0,
        temp_kf: data['main']['temp_max'] ?? 0.0,
        id: data['weather'][0]['id'] ?? 0,
        main: data['weather'][0]['main'] ?? '',
        description: data['weather'][0]['description'] ?? '',
        icon: data['weather'][0]['icon'] ?? '',
        cloudsall: data['clouds']['all'] ?? 0,
        windspeed: data['wind']['speed'] ?? 0.0,
        winddeg: data['wind']['deg'].toDouble() ?? 0.0,
        snow3h: data['snow']['3h'] ?? 0.0,
        syspod: data['sys']['pod'] ?? '',
        dt_txt: DateTime.parse(data['dt_txt']) ?? DateTime.now(),
      );

  Map<String, dynamic> toMap() => {
        'dt': dt,
        'temp': temp,
        'temp_min': temp_min,
        'temp_max': temp_max,
        'pressure': pressure,
        'sea_level': sea_level,
        'grnd_level': grnd_level,
        'humidity': humidity,
        'temp_kf': temp_kf,
        'id': id,
        'main': main,
        'description': description,
        'icon': icon,
        'cloudsall': cloudsall,
        'windspeed': windspeed,
        'winddeg': winddeg,
        'snow3h': snow3h,
        'syspod': syspod,
        'dt_txt': dt_txt,
      };

  @override
  List<Object?> get props => [
        dt,
        temp,
        temp_min,
        temp_max,
        pressure,
        sea_level,
        grnd_level,
        humidity,
        temp_kf,
        id,
        main,
        description,
        icon,
        cloudsall,
        windspeed,
        winddeg,
        snow3h,
        syspod,
        dt_txt,
      ];
}
