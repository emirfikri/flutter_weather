abstract class BaseWeatherRepository {
  Future getWeatherData({required String cityId});
  Future getWeatherDetail({required String id});
}
