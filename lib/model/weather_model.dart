// lib/model/weather_model.dart
class WeatherModel {
  final String temperature;
  final String humidity;
  final String condition;
  final String location;
  final DateTime lastUpdated;
  final bool isMock;

  WeatherModel({
    this.temperature = '25°C',
    this.humidity = '65%',
    this.condition = 'Sunny',
    this.location = 'New York, USA',
    DateTime? lastUpdated,
    this.isMock = false,
  }) : lastUpdated = lastUpdated ?? DateTime.now();

  WeatherModel copyWith({
    String? temperature,
    String? humidity,
    String? condition,
    String? location,
    DateTime? lastUpdated,
    bool? isMock,
  }) {
    return WeatherModel(
      temperature: temperature ?? this.temperature,
      humidity: humidity ?? this.humidity,
      condition: condition ?? this.condition,
      location: location ?? this.location,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      isMock: isMock ?? this.isMock,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'temperature': temperature,
      'humidity': humidity,
      'condition': condition,
      'location': location,
      'lastUpdated': lastUpdated.toIso8601String(),
      'isMock': isMock,
    };
  }

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temperature: json['temperature'] ?? '25°C',
      humidity: json['humidity'] ?? '65%',
      condition: json['condition'] ?? 'Sunny',
      location: json['location'] ?? 'New York, USA',
      lastUpdated: json['lastUpdated'] != null 
          ? DateTime.parse(json['lastUpdated'])
          : DateTime.now(),
      isMock: json['isMock'] ?? false,
    );
  }
}