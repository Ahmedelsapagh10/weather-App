abstract class WeatherState {}

class InitState extends WeatherState {}

class LoadingState extends WeatherState {}

class SuccessState extends WeatherState {}

class FailureState extends WeatherState {}
