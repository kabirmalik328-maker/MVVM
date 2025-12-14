// lib/utils/api_texts.dart
class ApiTexts {
  // API Error Messages
  static const String apiRequestFailed = 'API request failed, status code: ';
  static const String networkConnectionError = 'Network connection failed: ';
  static const String randomNumberFetchFailed = 'Failed to fetch random number: ';
  static const String weatherDataFormatError = 'Weather data format is incorrect';
  static const String weatherApiError = 'Weather API error';
  static const String usingMockData = 'Using mock weather data: ';
  static const String locationNotFound = 'Location not found';
  static const String invalidParameters = 'Invalid API parameters';
  static const String timeoutError = 'Request timeout';
  static const String jsonParseError = 'Failed to parse JSON response';
  
  // API Log Messages
  static const String logFetchingRandomNumber = 'API: Fetching random number from ';
  static const String logReceivedRandomNumber = 'API: Received random number: ';
  static const String logFetchingWeatherData = 'API: Fetching weather data';
  static const String logWeatherApiUrl = 'Weather API URL: ';
  static const String logWeatherResponseStatus = 'Weather API Response Status: ';
  static const String logWeatherDataReceived = 'Weather Data Received: ';
  static const String logTokyoWeatherFailed = 'Tokyo weather failed, trying New York...';
  static const String logAllApisFailed = 'All weather APIs failed, using mock data';
  static const String logFetchingMultipleNumbers = 'API: Fetching random numbers from ';
  
  // Weather Conditions
  static const String weatherUnknown = 'Unknown';
  static const String weatherClear = 'Clear';
  static const String weatherPartlyCloudy = 'Partly Cloudy';
  static const String weatherFoggy = 'Foggy';
  static const String weatherDrizzle = 'Drizzle';
  static const String weatherRainy = 'Rainy';
  static const String weatherSnowy = 'Snowy';
  static const String weatherShower = 'Shower';
  static const String weatherSnowShower = 'Snow Shower';
  static const String weatherThunderstorm = 'Thunderstorm';
  static const String weatherVariable = 'Variable';
  static const String weatherOvercast = 'Overcast';
  static const String weatherClearSky = 'Clear Sky';
  static const String weatherMainlyClear = 'Mainly Clear';
  
  // Weather Data Labels
  static const String temperatureLabel = 'temperature';
  static const String conditionLabel = 'condition';
  static const String humidityLabel = 'humidity';
  static const String windSpeedLabel = 'wind_speed';
  static const String timeLabel = 'time';
  static const String isMockLabel = 'is_mock';
  static const String locationLabel = 'location';
  
  // Units
  static const String celsius = '°C';
  static const String fahrenheit = '°F';
  static const String percentage = '%';
  static const String kmPerHour = ' km/h';
  static const String mph = ' mph';
  static const String metersPerSecond = ' m/s';
  
  // Location Names
  static const String tokyoLocation = 'Tokyo';
  static const String newYorkLocation = 'New York';
  static const String londonLocation = 'London';
  static const String parisLocation = 'Paris';
  static const String mockLocation = 'Mock Location';
  static const String unknownLocation = 'Unknown Location';
  
  // Mock Weather Conditions
  static const List<String> mockWeatherConditions = [
    'Clear',
    'Cloudy',
    'Partly Cloudy',
    'Foggy',
    'Light Rain',
    'Overcast',
    'Sunny',
    'Mostly Sunny',
    'Mostly Cloudy',
    'Rain Showers',
  ];
  
  // Success Messages
  static const String successWeatherFetched = 'Weather data fetched successfully';
  static const String successRandomNumberFetched = 'Random number fetched successfully';
  static const String successMultipleNumbersFetched = 'Multiple random numbers fetched successfully';
  
  // Validation Messages
  static const String minGreaterThanMaxError = 'Minimum value must be less than maximum value';
  static const String countOutOfRange = 'Count must be between 1 and 20';
  static const String invalidLocation = 'Invalid location specified';
}