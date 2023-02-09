import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart';
import '../../repositories/repositories.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final _weatherRepository;
  final ConnectivityRepository _connectivityRepository;
  WeatherBloc({
    ConnectivityRepository? connectivityRepository,
    weatherRepository,
  })  : _weatherRepository = weatherRepository ?? WeatherRepository(),
        _connectivityRepository =
            connectivityRepository ?? ConnectivityRepository(),
        super(WeatherInitial()) {
    _connectivityRepository.connectivityStream.stream.listen((event) {
      if (event == ConnectivityResult.none) {
        print('No internet');
        add(NoInternet());
      } else {
        print('Yes internet');
        add(WeatherGetInitial());
      }
    });

    on<WeatherGetInitial>((event, emit) async {
      emit(WeatherLoading());
      List<Weather> item =
          await _weatherRepository.getWeatherData(cityId: '524901');
      emit(WeatherLoaded(data: item));
    });

    on<NoInternet>((event, emit) {
      emit(WeatherNoInternet());
    });
  }
}
