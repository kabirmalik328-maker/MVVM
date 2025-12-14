class Logger {
  static void log(String message) {
    print('📱 [LOG] ${DateTime.now().toIso8601String()}: $message');
  }

  static void error(String message, [Object? error]) {
    print('❌ [ERROR] ${DateTime.now().toIso8601String()}: $message');
    if (error != null) {
      print('   Error Details: $error');
    }
  }

  static void success(String message) {
    print('✅ [SUCCESS] ${DateTime.now().toIso8601String()}: $message');
  }
}