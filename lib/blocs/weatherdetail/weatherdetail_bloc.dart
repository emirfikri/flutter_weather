import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'weatherdetail_event.dart';
part 'weatherdetail_state.dart';

class WeatherdetailBloc extends Bloc<WeatherdetailEvent, WeatherdetailState> {
  WeatherdetailBloc() : super(WeatherdetailInitial()) {
    on<WeatherdetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
