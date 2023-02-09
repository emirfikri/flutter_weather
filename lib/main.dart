import 'package:flutter/material.dart';
import '/repositories/repositories.dart';

import 'blocs/export_bloc.dart';
import 'screens/home/home_page.dart';
import 'simple_bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (context) => WeatherRepository()),
          RepositoryProvider(create: (context) => ConnectivityRepository()),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => WeatherBloc(
                    weatherRepository: context.read<WeatherRepository>(),
                    connectivityRepository:
                        context.read<ConnectivityRepository>())),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              '/home': (context) => const HomePage(),
            },
            initialRoute: HomePage.routeName,
          ),
        ));
  }
}
