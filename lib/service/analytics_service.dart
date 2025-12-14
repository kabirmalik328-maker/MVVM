// ----- Analytics Service -----
class AnalyticsService {
  void logCounterIncrement(int count) {
    print('Analytics: Counter incremented to $count');
  }

  void logCounterDecrement(int count) {
    print('Analytics: Counter decremented to $count');
  }

  void logCounterReset() {
    print('Analytics: Counter reset');
  }

  void logAppOpen() {
    print('Analytics: App opened');
  }
}
