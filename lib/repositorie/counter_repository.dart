// import 'package:counter_app/model/counter_model.dart';
// import 'package:counter_app/model/weather_model.dart';
// import 'package:counter_app/service/api_service.dart';
// import 'package:counter_app/service/shared_prefs_service.dart';

// class CounterRepository {
//   final SharedPrefsService _sharedPrefsService;
//   final ApiService _apiService;
  
//   // Cache for weather data
//   WeatherModel? _cachedWeather;
//   DateTime? _lastWeatherFetch;

//   CounterRepository({
//     required SharedPrefsService sharedPrefsService,
//     required ApiService apiService,
//   })  : _sharedPrefsService = sharedPrefsService,
//         _apiService = apiService;

//   // ===== Counter Operations =====
  
//   Future<CounterModel> getCounter() async {
//     final data = await _sharedPrefsService.getCounterData();
//     if (data != null) {
//       return CounterModel.fromJson(data);
//     }
//     return CounterModel(
//       count: 0,
//       lastUpdated: DateTime.now(),
//       note: 'Initial counter',
//     );
//   }

//   Future<void> saveCounter(CounterModel counter) async {
//     await _sharedPrefsService.saveCounterData(counter.toJson());
//   }

//   Future<void> resetCounter() async {
//     await _sharedPrefsService.clearCounterData();
//   }

//   // ===== API Operations =====
  
//   Future<CounterModel> fetchRandomCounter() async {
//     final randomValue = await _apiService.fetchRandomNumber();
//     final newCounter = CounterModel(
//       count: randomValue,
//       lastUpdated: DateTime.now(),
//       note: 'Set from API at ${DateTime.now()}',
//     );
//     await saveCounter(newCounter);
//     return newCounter;
//   }

//   Future<WeatherModel> getWeather({bool forceRefresh = false}) async {
//     // Check cache first
//     if (!forceRefresh && _isCacheValid()) {
//       return _cachedWeather!;
//     }

//     // Fetch fresh data
//     final weatherData = await _apiService.fetchWeatherData();
//     _cachedWeather = WeatherModel.fromJson(weatherData);
//     _lastWeatherFetch = DateTime.now();
    
//     return _cachedWeather!;
//   }

//   bool _isCacheValid() {
//     if (_cachedWeather == null || _lastWeatherFetch == null) {
//       return false;
//     }
//     final difference = DateTime.now().difference(_lastWeatherFetch!);
//     return difference.inMinutes < 10; // Cache for 10 minutes
//   }
// }