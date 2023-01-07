import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/HomeScreen/provider/cubit.dart';
import 'package:weather_app/HomeScreen/provider/state.dart';
import 'package:weather_app/HomeScreen/provider/weather_api.dart';
import 'package:weather_app/HomeScreen/provider/weather_model.dart';

import 'package:weather_app/HomeScreen/view/search.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherModel? weatherModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => WeatherCubit(WeatherApi()),
        child: Scaffold(
          body: BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              if (state is LoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is SuccessState) {
                weatherModel =
                    BlocProvider.of<WeatherCubit>(context).weatherModel;
                return SafeArea(
                    child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                              Colors.white,
                              Colors.blue.shade100,
                              Colors.blue.shade200,
                            ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)),
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(8),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Spacer(
                                flex: 2,
                              ),
                              Text(
                                // weatherModel?.name ?? ''
                                weatherModel!.name,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 36,
                                ),
                              ),
                              Text(
                                weatherModel?.date ?? '',
                                style: const TextStyle(
                                  color: Colors.black38,
                                  fontSize: 18,
                                ),
                              ),
                              Spacer(
                                flex: 1,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    child: Image.network(
                                      //http:
                                      'http:${weatherModel?.imageOFWeather ?? ''}',
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.contain,
                                      scale: 1,
                                    ),
                                  ),
                                  Text(
                                    weatherModel?.temp.toString() ?? '',
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 32,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "min :${weatherModel?.minTemp.toString() ?? ''} ",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        "max: ${weatherModel?.maxTemp.toString() ?? ''}",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Spacer(
                                flex: 1,
                              ),
                              Text(
                                weatherModel?.nameOfWeather ?? '',
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 32,
                                ),
                              ),
                              Spacer(
                                flex: 5,
                              ),
                            ])));
              } else if (state is FailureState) {
                return Center(
                  child: Text(
                    'API IS Disabled',
                  ),
                );
              } else {
                return Center(child: Text('Go To Search!'));
              }
            },
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return SearchScreen();
              })));
            },
            child: const Icon(Icons.search, color: Colors.black, size: 32),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ));
  }
}
