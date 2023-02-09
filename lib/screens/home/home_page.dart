import 'package:flutter/material.dart';
import 'package:weatherapp/screens/home/widgets/weathertile.dart';
import '../../configs/size_config.dart';
import '/models/models.dart';
import '../../helpers/style.dart';
import '/blocs/export_bloc.dart';
import '/repositories/repositories.dart';
import 'widgets/weatherlist.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    WeatherBloc weatherBloc =
        WeatherBloc(weatherRepository: context.read<WeatherRepository>());

    return BlocProvider(
      create: (context) => weatherBloc,
      child: const HomePageView(),
    );
  }
}

class HomePageView extends StatelessWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text('Weather App'),
        actions: [
          GestureDetector(
            onTap: () {
              context.read<WeatherBloc>().add(WeatherGetInitial());
            },
            child: const Icon(Icons.refresh_sharp),
          ),
        ],
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
        if (state is WeatherLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else if (state is WeatherNoInternet) {
          return const Center(
            child: Text("No Internet"),
          );
        } else if (state is WeatherLoaded) {
          return WeatherList(weatherList: state.data);
        }
        return const Text("Error");
      }),
    );
  }
}
