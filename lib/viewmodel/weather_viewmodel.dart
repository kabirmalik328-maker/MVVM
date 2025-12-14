
// import 'package:flutter/material.dart';
// import 'package:counter_app/model/weather_model.dart';
// import 'package:counter_app/repositorie/counter_repository.dart';
// import 'package:counter_app/util/logger.dart';

// class WeatherViewModel extends ChangeNotifier {
//   final CounterRepository _repository;
  
//   WeatherModel? _weatherData;
//   bool _isLoading = false;
//   String? _errorMessage;
//   DateTime? _lastUpdated;

//   WeatherViewModel({
//     required CounterRepository repository,
//   }) : _repository = repository {
//     _initialize();
//   }

//   WeatherModel? get weatherData => _weatherData;
//   bool get isLoading => _isLoading;
//   String? get errorMessage => _errorMessage;
//   DateTime? get lastUpdated => _lastUpdated;

//   Future<void> _initialize() async {
//     await refreshWeather();
//   }

//   Future<void> refreshWeather() async {
//     try {
//       _isLoading = true;
//       _errorMessage = null;
//       notifyListeners();

//       final weather = await _repository.getWeather(forceRefresh: true);
//       _weatherData = weather;
//       _lastUpdated = DateTime.now();
      
//       Logger.success('WeatherViewModel: Weather refreshed successfully');
//     } catch (e) {
//       Logger.error('WeatherViewModel Error: Failed to refresh weather', e);
//       _errorMessage = 'Failed to fetch weather data';
//     } finally {
//       _isLoading = false;
//       notifyListeners();
//     }
//   }

//   void clearError() {
//     _errorMessage = null;
//     notifyListeners();
//   }

//   // Weather info for compatibility
//   Map<String, dynamic>? get weatherInfo {
//     if (_weatherData == null) return null;
//     return {
//       'temperature': _weatherData!.temperature,
//       'humidity': _weatherData!.humidity,
//       'condition': _weatherData!.condition,
//       'location': _weatherData!.location,
//       'is_mock': _weatherData!.isMock,
//     };
//   }
// }