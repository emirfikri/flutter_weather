part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherNoInternet extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final List<Weather> data;
  const WeatherLoaded({required this.data});

  @override
  List<Object> get props => [data];
}
