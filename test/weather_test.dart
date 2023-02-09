import 'package:bloc_test/bloc_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weatherapp/blocs/export_bloc.dart';
import 'package:weatherapp/repositories/weather/mock_weather_repository.dart';

void main() {
  group('Weather Bloc test', () {
    late WeatherBloc weatherBloc;
    MockWeatherRepository mockWeatherRepository;

    setUp(() async {
      WidgetsFlutterBinding.ensureInitialized();
      EquatableConfig.stringify = true;
      mockWeatherRepository = MockWeatherRepository();
      weatherBloc = WeatherBloc(weatherRepository: mockWeatherRepository);
    });
    group('Weather Initial state', () {
      test('Initial state is Initial()', () {
        expect(weatherBloc.state, WeatherInitial());
      });
    });

    blocTest<WeatherBloc, WeatherState>(
      'emits NoInternet states when Offline',
      build: () => weatherBloc,
      act: (bloc) {
        bloc.add(NoInternet());
      },
      expect: () => [
        WeatherNoInternet(),
      ],
    );

    blocTest<WeatherBloc, WeatherState>(
      'emits [WeatherLoading, WeatherLoaded] states for'
      'successful weather loads',
      build: () => weatherBloc,
      act: (bloc) {
        bloc.add(WeatherGetInitial());
      },
      expect: () => [
        WeatherLoading(),
        WeatherLoaded(data: mockWeather),
      ],
    );

    tearDown(() {
      weatherBloc.close();
    });
  });
}
