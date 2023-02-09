import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:weatherapp/helpers/constants.dart';
import 'package:weatherapp/helpers/style.dart';
import 'package:weatherapp/screens/home/widgets/tile_decoration.dart';
import 'package:weatherapp/models/models.dart';

import '../../weatherdetail/weatherdetail_page.dart';

class WeatherTiles extends StatelessWidget {
  final Weather weather;
  const WeatherTiles({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formatteddate = Jiffy(weather.dt_txt).format('do MMM yyyy');
    var formattedtime = Jiffy(weather.dt_txt).format('hh:mm a');
    return GestureDetector(
      onTap: () {
        Navigator.push(context, WeatherDetailView.route(weather: weather));
      },
      child: Container(
        decoration: tileDecoration(),
        margin: const EdgeInsets.all(10),
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
              color: appBarColor,
              border: Border.all(
                  color: Colors.transparent,
                  width: 0,
                  style: BorderStyle.solid),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5.0),
                topRight: Radius.circular(5.0),
              ),
            ),
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Text(
                  formatteddate,
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                'https://openweathermap.org/img/wn/${weather.icon}@2x.png',
                errorBuilder: (context, error, stackTrace) {
                  return const SizedBox(
                    height: 50,
                    width: 50,
                    child: Text(
                      'Image not found',
                      maxLines: 5,
                    ),
                  );
                },
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(
                    weather.main,
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    formattedtime,
                    style: const TextStyle(fontSize: 16, color: Colors.white60),
                  ),
                ],
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Image.network(
                      'https://openweathermap.org/img/wn/${weather.icon}@2x.png',
                      height: 50,
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                    Text(
                      DateFormat('hh:mm a')
                          .format(weather.dt_txt.add(const Duration(hours: 1))),
                      style:
                          const TextStyle(fontSize: 16, color: Colors.white60),
                    ),
                  ],
                ),
                Container(
                  color: Colors.white54,
                  height: Constants.height * 0.05,
                  width: 0.5,
                ),
                Column(
                  children: [
                    Image.network(
                      'https://openweathermap.org/img/wn/${weather.icon}@2x.png',
                      height: 50,
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                    Text(
                      DateFormat('hh:mm a')
                          .format(weather.dt_txt.add(const Duration(hours: 2))),
                      style:
                          const TextStyle(fontSize: 16, color: Colors.white60),
                    ),
                  ],
                ),
                Container(
                  color: Colors.white54,
                  height: Constants.height * 0.05,
                  width: 0.5,
                ),
                Column(
                  children: [
                    Image.network(
                      'https://openweathermap.org/img/wn/${weather.icon}@2x.png',
                      height: 50,
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                    Text(
                      DateFormat('hh:mm a')
                          .format(weather.dt_txt.add(const Duration(hours: 3))),
                      style:
                          const TextStyle(fontSize: 16, color: Colors.white60),
                    ),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
