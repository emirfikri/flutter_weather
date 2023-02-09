import 'package:flutter/material.dart';
import 'package:weatherapp/models/models.dart';

import 'weathertile.dart';

class WeatherList extends StatelessWidget {
  final List<Weather> weatherList;
  const WeatherList({Key? key, required this.weatherList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: weatherList.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              WeatherTiles(weather: weatherList[index]),
              index == weatherList.length - 1
                  ? const SizedBox(
                      height: 50,
                    )
                  : const SizedBox(),
            ],
          );
        });
  }
}
