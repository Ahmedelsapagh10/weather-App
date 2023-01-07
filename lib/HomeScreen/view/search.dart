import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/HomeScreen/provider/cubit.dart';
import 'package:weather_app/HomeScreen/provider/state.dart';
import 'package:weather_app/HomeScreen/provider/weather_api.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(WeatherApi()),
      child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          return Scaffold(
            // backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text(
                'search',
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: TextFormField(
                  onChanged: ((value) {
                    cityName = value;
                  }),
                  onFieldSubmitted: ((value) async {
                    await BlocProvider.of<WeatherCubit>(context)
                        .getWeaherData(cityName: cityName!);
                    Navigator.pop(context);
                  }),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                        onTap: () async {
                          await BlocProvider.of<WeatherCubit>(context)
                              .getWeaherData(cityName: cityName!);
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.search)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    //  prefixIcon: const Icon(Icons.search),
                    hintText: 'search',
                    label: const Text('Enter a city '),
                  ),
                  // decoration: InputDecoration.collapsed(hintText: 'search'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
