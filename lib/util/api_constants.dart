// lib/utils/api_constants.dart
import 'dart:math';

class ApiConstants {

  static const String corsProxy = 'https://api.allorigins.win/raw?url=';
  static const String randomNumberApi = 'https://www.randomnumberapi.com';
  static const String randomNumberApiCors = 'https://www.randomnumberapi.com/api/v1.0/random';
  static const String randomOrgApi = 'https://www.random.org/integers/';
  static const String mockRandomApi = 'https://jsonplaceholder.typicode.com/posts/';
  
  // =================== WEATHER APIS ===================

  static const String openMeteoApi = 'https://api.open-meteo.com/v1/forecast';
  static const String mockWeatherApi = 'https://jsonplaceholder.typicode.com/posts/';
  
  // =================== LOCATION DATA ===================
  
  static const Map<String, Map<String, dynamic>> locations = {
    // Major cities
    'tokyo': {
      'latitude': 35.6762,
      'longitude': 139.6503,
      'displayName': 'Tokyo, Japan',
      'aliases': ['東京', 'tokyo', 'tōkyō']
    },
    'newYork': {
      'latitude': 40.7128,
      'longitude': -74.0060,
      'displayName': 'New York, USA',
      'aliases': ['new york', 'nyc', 'new-york', 'ny']
    },
    'london': {
      'latitude': 51.5074,
      'longitude': -0.1278,
      'displayName': 'London, UK',
      'aliases': ['london', 'lndn', 'lnd']
    },
    'paris': {
      'latitude': 48.8566,
      'longitude': 2.3522,
      'displayName': 'Paris, France',
      'aliases': ['paris', 'prs']
    },
    
    // Additional popular cities
    'delhi': {
      'latitude': 28.6139,
      'longitude': 77.2090,
      'displayName': 'Delhi, India',
      'aliases': ['delhi', 'new delhi', 'dilli']
    },
    'mumbai': {
      'latitude': 19.0760,
      'longitude': 72.8777,
      'displayName': 'Mumbai, India',
      'aliases': ['mumbai', 'bombay']
    },
    'beijing': {
      'latitude': 39.9042,
      'longitude': 116.4074,
      'displayName': 'Beijing, China',
      'aliases': ['beijing', 'peking']
    },
    'dubai': {
      'latitude': 25.2048,
      'longitude': 55.2708,
      'displayName': 'Dubai, UAE',
      'aliases': ['dubai']
    },
    'sydney': {
      'latitude': -33.8688,
      'longitude': 151.2093,
      'displayName': 'Sydney, Australia',
      'aliases': ['sydney', 'sidney']
    },
    'berlin': {
      'latitude': 52.5200,
      'longitude': 13.4050,
      'displayName': 'Berlin, Germany',
      'aliases': ['berlin']
    },
    'singapore': {
      'latitude': 1.3521,
      'longitude': 103.8198,
      'displayName': 'Singapore',
      'aliases': ['singapore', 'sg']
    },
  };
  
  // =================== WEATHER CONFIGURATION ===================
  
  // Complete WMO Weather Code Descriptions
  static const Map<int, String> weatherCodeDescriptions = {
    // Clear/Clearer sky
    0: 'Clear sky',
    1: 'Mainly clear',
    2: 'Partly cloudy',
    3: 'Overcast',
    
    // Fog
    45: 'Fog',
    48: 'Depositing rime fog',
    
    // Drizzle
    51: 'Light drizzle',
    53: 'Moderate drizzle',
    55: 'Dense drizzle',
    56: 'Light freezing drizzle',
    57: 'Dense freezing drizzle',
    
    // Rain
    61: 'Light rain',
    63: 'Moderate rain',
    65: 'Heavy rain',
    66: 'Light freezing rain',
    67: 'Heavy freezing rain',
    80: 'Light rain showers',
    81: 'Moderate rain showers',
    82: 'Violent rain showers',
    
    // Snow
    71: 'Light snow fall',
    73: 'Moderate snow fall',
    75: 'Heavy snow fall',
    77: 'Snow grains',
    85: 'Light snow showers',
    86: 'Heavy snow showers',
    
    // Thunderstorm
    95: 'Thunderstorm',
    96: 'Thunderstorm with light hail',
    99: 'Thunderstorm with heavy hail',
  };
  
  // Simplified weather conditions for mock data
  static const List<String> simplifiedWeatherConditions = [
    'Clear',
    'Partly Cloudy',
    'Cloudy',
    'Rainy',
    'Snowy',
    'Windy',
    'Foggy',
    'Thunderstorm',
    'Sunny',
    'Mostly Sunny',
    'Showers',
    'Light Rain',
  ];
  
  // =================== DEFAULT VALUES ===================
  
  // Random Number Defaults
  static const int defaultMinNumber = 1;
  static const int defaultMaxNumber = 100;
  static const int defaultRandomCount = 1;
  static const int defaultBulkCount = 5;
  
  // Weather Defaults
  static const String defaultLocation = 'tokyo';
  static const int defaultForecastDays = 1;
  
  // =================== MOCK DATA RANGES ===================
  
  // Realistic temperature ranges by location (in Celsius)
  static const Map<String, Map<String, dynamic>> mockTemperatureRanges = {
    'tokyo': {
      'min': 15,
      'max': 30,
      'avg': 22,
      'unit': 'C'
    },
    'newYork': {
      'min': -5,
      'max': 25,
      'avg': 15,
      'unit': 'C'
    },
    'london': {
      'min': 5,
      'max': 20,
      'avg': 12,
      'unit': 'C'
    },
    'paris': {
      'min': 10,
      'max': 25,
      'avg': 17,
      'unit': 'C'
    },
    'delhi': {
      'min': 25,
      'max': 45,
      'avg': 35,
      'unit': 'C'
    },
    'mumbai': {
      'min': 24,
      'max': 32,
      'avg': 28,
      'unit': 'C'
    },
    'beijing': {
      'min': -10,
      'max': 30,
      'avg': 15,
      'unit': 'C'
    },
    'dubai': {
      'min': 20,
      'max': 45,
      'avg': 32,
      'unit': 'C'
    },
    'sydney': {
      'min': 10,
      'max': 25,
      'avg': 18,
      'unit': 'C'
    },
    'default': {
      'min': 20,
      'max': 35,
      'avg': 27,
      'unit': 'C'
    },
  };
  
  // Humidity ranges (percentage)
  static const List<int> humidityRange = [30, 70];
  
  // Wind speed ranges (km/h)
  static const List<int> windSpeedRange = [5, 25];
  
  // Precipitation probability (percentage)
  static const List<int> precipitationRange = [0, 100];
  
  // UV Index ranges
  static const List<int> uvIndexRange = [0, 10];
  
  // =================== PERFORMANCE SETTINGS ===================
  
  // Timeouts
  static const Duration apiTimeout = Duration(seconds: 15); // Increased for reliability
  static const Duration connectionTimeout = Duration(seconds: 8);
  static const Duration receiveTimeout = Duration(seconds: 10);
  
  // Retry Settings
  static const int maxRetries = 3;
  static const Duration retryDelay = Duration(milliseconds: 800);
  static const Duration retryBackoffFactor = Duration(milliseconds: 200);
  
  // Cache Settings
  static const Duration weatherCacheDuration = Duration(minutes: 10);
  static const Duration randomCacheDuration = Duration(minutes: 1);
  
  // =================== VALIDATION LIMITS ===================
  
  // Random Number Limits
  static const int minRandomValue = -1000000;
  static const int maxRandomValue = 1000000;
  static const int minBulkCount = 1;
  static const int maxBulkCount = 1000;
  
  // Weather Parameter Limits
  static const double minLatitude = -90.0;
  static const double maxLatitude = 90.0;
  static const double minLongitude = -180.0;
  static const double maxLongitude = 180.0;
  
  // =================== HTTP CONFIGURATION ===================
  
  // Default Headers
  static const Map<String, String> defaultHeaders = {
    'User-Agent': 'FlutterCounterApp/2.0',
    'Accept': 'application/json',
    'Content-Type': 'application/json; charset=utf-8',
    'Accept-Language': 'en-US,en;q=0.9',
    'Accept-Encoding': 'gzip, deflate',
  };
  
  // Cache Headers
  static const Map<String, String> cacheHeaders = {
    'Cache-Control': 'public, max-age=300',
    'Expires': '300',
  };
  
  // No-Cache Headers (for testing)
  static const Map<String, String> noCacheHeaders = {
    'Cache-Control': 'no-cache, no-store, must-revalidate',
    'Pragma': 'no-cache',
    'Expires': '0',
  };
  
  // =================== APP CONSTANTS ===================
  
  // Units
  static const String celsius = '°C';
  static const String fahrenheit = '°F';
  static const String kmPerHour = ' km/h';
  static const String mph = ' mph';
  static const String percentage = '%';
  static const String pressureUnit = ' hPa';
  
  // Date/Time Formats
  static const String dateFormat = 'yyyy-MM-dd';
  static const String timeFormat = 'HH:mm';
  static const String dateTimeFormat = 'yyyy-MM-dd HH:mm';
  
  // =================== ERROR MESSAGES ===================
  
  // API Error Messages
  static const String apiTimeoutMessage = 'Request timed out. Please check your connection.';
  static const String apiConnectionError = 'Unable to connect. Check your internet connection.';
  static const String apiServerError = 'Server error. Please try again later.';
  static const String apiRateLimitError = 'Rate limit exceeded. Please wait a moment.';
  
  // Validation Error Messages
  static const String invalidLocationMessage = 'Location not found. Please try another city.';
  static const String invalidRangeMessage = 'Invalid range. Min must be less than max.';
  static const String invalidCountMessage = 'Count must be between $minBulkCount and $maxBulkCount';
  
  // =================== FEATURE FLAGS ===================
  
  // Enable/disable features
  static const bool enableCaching = true;
  static const bool enableRetry = true;
  static const bool enableMockFallback = true;
  static const bool enableDetailedLogging = true;
  
  // API Feature Flags
  static const bool useOpenMeteoAPI = true;
  static const bool useRandomNumberAPI = true;
  static const bool useRandomOrgAPI = true;
  
  // =================== HELPER METHODS ===================
  
  // Get location by name (case-insensitive)
  static String? getLocationKey(String input) {
    final normalized = input.toLowerCase().trim();
    
    // First, check exact matches
    if (locations.containsKey(normalized)) {
      return normalized;
    }
    
    // Check aliases
    for (final entry in locations.entries) {
      final data = entry.value;
      if (data.containsKey('aliases')) {
        final aliases = (data['aliases'] as List).cast<String>();
        if (aliases.any((alias) => alias.toLowerCase() == normalized)) {
          return entry.key;
        }
      }
    }
    
    // Check partial matches in display names
    for (final entry in locations.entries) {
      final displayName = entry.value['displayName'] as String;
      if (displayName.toLowerCase().contains(normalized)) {
        return entry.key;
      }
    }
    
    return null;
  }
  
  // Get display name for location
  static String getDisplayName(String locationKey) {
    if (locations.containsKey(locationKey)) {
      return locations[locationKey]!['displayName'] as String;
    }
    return 'Unknown Location';
  }
  
  // Get temperature range for location
  static Map<String, int> getTemperatureRange(String locationKey) {
    if (mockTemperatureRanges.containsKey(locationKey)) {
      return {
        'min': mockTemperatureRanges[locationKey]!['min']!,
        'max': mockTemperatureRanges[locationKey]!['max']!,
      };
    }
    return {
      'min': mockTemperatureRanges['default']!['min']!,
      'max': mockTemperatureRanges['default']!['max']!,
    };
  }
  
  // Generate random within realistic range
  static int generateRealisticTemperature(String locationKey) {
    final range = getTemperatureRange(locationKey);
    final random = Random();
    return range['min']! + random.nextInt(range['max']! - range['min']! + 1);
  }
  
  // Generate random humidity
  static int generateRealisticHumidity() {
    final random = Random();
    return humidityRange[0] + random.nextInt(humidityRange[1] - humidityRange[0] + 1);
  }
  
  // Generate random wind speed
  static int generateRealisticWindSpeed() {
    final random = Random();
    return windSpeedRange[0] + random.nextInt(windSpeedRange[1] - windSpeedRange[0] + 1);
  }
  
  // Get weather description from code
  static String getWeatherDescription(int code) {
    return weatherCodeDescriptions[code] ?? simplifiedWeatherConditions[code % simplifiedWeatherConditions.length];
  }
  
  // Build complete API URL with CORS proxy
  static String buildUrl(String apiUrl, {bool useProxy = true}) {
    if (useProxy && corsProxy.isNotEmpty) {
      return '$corsProxy${Uri.encodeComponent(apiUrl)}';
    }
    return apiUrl;
  }
  
  // Build OpenMeteo URL
  static String buildOpenMeteoUrl(double latitude, double longitude) {
    return buildUrl(
      '$openMeteoApi?latitude=$latitude&longitude=$longitude'
      '&current_weather=true'
      '&hourly=temperature_2m,relative_humidity_2m,weather_code,wind_speed_10m'
      '&daily=weather_code,temperature_2m_max,temperature_2m_min'
      '&timezone=auto'
      '&forecast_days=$defaultForecastDays',
      useProxy: useOpenMeteoAPI
    );
  }
  
  // Build Random Number URL
  static String buildRandomNumberUrl(int min, int max, int count) {
    final apiUrl = '$randomNumberApiCors?min=$min&max=$max&count=$count';
    return buildUrl(apiUrl, useProxy: useRandomNumberAPI);
  }
  
  // Build Random.org URL
  static String buildRandomOrgUrl(int min, int max) {
    final apiUrl = '$randomOrgApi?num=1&min=$min&max=$max&col=1&base=10&format=plain&rnd=new';
    return buildUrl(apiUrl, useProxy: useRandomOrgAPI);
  }
}