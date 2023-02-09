import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/repositories/repositories.dart';

var mockWeather = <Weather>[
  Weather(
      dt: 1,
      temp: 200.0,
      temp_min: 200.0,
      temp_max: 210.0,
      pressure: 100.0,
      sea_level: 100.0,
      grnd_level: 100.0,
      humidity: 100,
      temp_kf: 100.0,
      id: 1,
      main: 'Plain',
      description: 'Plain View',
      icon: '10n',
      cloudsall: 100,
      windspeed: 100.0,
      winddeg: 100.0,
      snow3h: 100.0,
      syspod: 'syspod',
      dt_txt: DateTime(2022)),
  Weather(
      dt: 2,
      temp: 200.0,
      temp_min: 200.0,
      temp_max: 210.0,
      pressure: 100.0,
      sea_level: 100.0,
      grnd_level: 100.0,
      humidity: 100,
      temp_kf: 100.0,
      id: 2,
      main: 'Plain',
      description: 'Plain View',
      icon: '10n',
      cloudsall: 100,
      windspeed: 100.0,
      winddeg: 100.0,
      snow3h: 100.0,
      syspod: 'syspod',
      dt_txt: DateTime(2022)),
  Weather(
      dt: 3,
      temp: 200.0,
      temp_min: 200.0,
      temp_max: 210.0,
      pressure: 100.0,
      sea_level: 100.0,
      grnd_level: 100.0,
      humidity: 100,
      temp_kf: 100.0,
      id: 3,
      main: 'Plain',
      description: 'Plain View',
      icon: '10n',
      cloudsall: 100,
      windspeed: 100.0,
      winddeg: 100.0,
      snow3h: 100.0,
      syspod: 'syspod',
      dt_txt: DateTime(2022)),
];

class MockWeatherRepository implements BaseWeatherRepository {
  @override
  Future getWeatherData({required String cityId}) async {
    return mockWeather;
    // Future.delayed(const Duration(seconds: 2), () => [...mockWeather]);
  }

  @override
  Future getWeatherDetail({required String id}) {
    // TODO: implement getWeatherDetail
    throw UnimplementedError();
  }
}
