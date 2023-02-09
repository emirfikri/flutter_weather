import 'dart:convert';

import 'package:weatherapp/repositories/apikey.dart';
import 'package:http/http.dart' as http;
import '../../models/weather_model.dart';
import 'base_weather_repository.dart';

class WeatherRepository extends BaseWeatherRepository {
  String domain = 'https://samples.openweathermap.org/data/2.5/forecast';

  @override
  Future getWeatherData({required String cityId}) async {
    String endpoint = '$domain?id=$cityId&appid=${Apikey.key}';
    var response = await http.get(
      Uri.parse(endpoint),
    );
    var rawdata = response.body;
    var decodedata = json.decode(rawdata);

    List item = decodedata['list'];
    List<Weather> weatherList = [];
    for (var currentWeather in item) {
      weatherList.add(Weather.fromMap(currentWeather));
    }
    return weatherList;
  }

  @override
  Future getWeatherDetail({required String id}) {
    // TODO: implement getWeatherDetail
    throw UnimplementedError();
  }
}
