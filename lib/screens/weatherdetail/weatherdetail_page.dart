import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:weatherapp/helpers/constants.dart';
import '/models/models.dart';
import '../../helpers/style.dart';

class WeatherDetailView extends StatelessWidget {
  final Weather weather;
  static const String routeName = '/weatherdetail';

  static Route<void> route({required Weather weather}) {
    return MaterialPageRoute(
      builder: (context) => WeatherDetailView(weather: weather),
    );
  }

  const WeatherDetailView({Key? key, required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formatteddate = Jiffy(weather.dt_txt).format('hh:mm a do MMM yyyy');
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text('Weather App'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: Constants.height * 0.05,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.white30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    formatteddate,
                    style: const TextStyle(
                        color: Colors.white38,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Constants.height * 0.05,
            ),
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
            Text(
              weather.main,
              style: const TextStyle(color: Colors.white, fontSize: 36),
            ),
            SizedBox(
              height: Constants.height * 0.05,
            ),
            Container(
              color: Colors.white54,
              width: Constants.width * 0.8,
              height: 0.5,
            ),
            SizedBox(
              height: Constants.height * 0.02,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Wind: ',
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          weather.windspeed.toString(),
                          style: const TextStyle(
                            color: Colors.white60,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Current: ',
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          fToC(weather.temp),
                          style: const TextStyle(
                            color: Colors.white60,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Max: ',
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          fToC(weather.temp_max),
                          style: const TextStyle(
                            color: Colors.white60,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Min: ',
                          style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          fToC(weather.temp_min),
                          style: const TextStyle(
                            color: Colors.white60,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: Constants.height * 0.02,
            ),
            Container(
              color: Colors.white54,
              width: Constants.width * 0.8,
              height: 0.5,
            ),
          ]),
        ),
      ),
    );
  }

  fToC(num f) {
    var celcius = ((f - 32) * 5 / 9);
    return '${celcius.toStringAsFixed(2)} \u00b0C';
  }
}
