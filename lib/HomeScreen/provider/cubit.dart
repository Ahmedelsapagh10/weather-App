import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/HomeScreen/provider/state.dart';
import 'package:weather_app/HomeScreen/provider/weather_api.dart';
import 'package:weather_app/HomeScreen/provider/weather_model.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.api) : super(InitState());
  WeatherApi api;
  WeatherModel? weatherModel;
  getWeaherData({required String cityName}) async {
    emit(LoadingState());
    try {
      weatherModel = await api.getData(cityName: cityName);
      emit(SuccessState());
    } on Exception catch (e) {
      print(e.toString());
      emit(FailureState());
    }
  }

  ///
}
