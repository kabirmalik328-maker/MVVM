import 'package:flutter/material.dart';

class CounterViewModel extends ChangeNotifier {
  int _count = 0;
  String? _note;
  bool _isDarkMode = false;
  bool _isLoading = false;
  String? _errorMessage;
  String? _searchQuery;
  DateTime _lastUpdated = DateTime.now();

  int get count => _count;
  String? get note => _note;
  bool get isDarkMode => _isDarkMode;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  String? get searchQuery => _searchQuery;
  DateTime get lastUpdated => _lastUpdated;
  
  // Get counter object (if you have Counter model)
  Map<String, dynamic> get counter => {
    'count': _count,
    'note': _note,
    'lastUpdated': _lastUpdated,
  };

  bool get matchesSearch {
    if (_searchQuery == null || _searchQuery!.isEmpty) return true;
    final query = _searchQuery!.toLowerCase();
    return _count.toString().contains(query) || 
           (_note?.toLowerCase().contains(query) ?? false);
  }

  void increment() {
    _count++;
    _lastUpdated = DateTime.now();
    notifyListeners();
  }

  void decrement() {
    _count--;
    _lastUpdated = DateTime.now();
    notifyListeners();
  }

  void reset() {
    _count = 0;
    _note = null;
    _lastUpdated = DateTime.now();
    notifyListeners();
  }

  void updateNote(String newNote) {
    _note = newNote;
    _lastUpdated = DateTime.now();
    notifyListeners();
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  void updateSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void clearSearch() {
    _searchQuery = null;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void setError(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  // API methods (dummy implementations)
  Future<void> fetchRandomCount() async {
    setLoading(true);
    await Future.delayed(const Duration(seconds: 1));
    _count = (DateTime.now().millisecondsSinceEpoch % 100) - 50;
    _lastUpdated = DateTime.now();
    setLoading(false);
  }

  Future<void> refreshWeather() async {
    setLoading(true);
    await Future.delayed(const Duration(seconds: 1));
    setLoading(false);
  }
}