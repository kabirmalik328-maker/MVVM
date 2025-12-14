import 'package:counter_app/model/user_model.dart';
import 'package:counter_app/repositorie/auth_repositorie.dart';
import 'package:counter_app/service/shared_prefs_service.dart';
import 'package:flutter/material.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthRepository _authRepo = AuthRepository();
  
  UserModel? _user;
  UserModel? get user => _user;
  
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  
  String? _error;
  String? get error => _error;
  
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;
  
  AuthViewModel() {
    checkLoginStatus();
  }
  
  Future<void> checkLoginStatus() async {
    try {
      final isLoggedIn = await SharedPrefsService.isUserLoggedIn();
      
      if (isLoggedIn) {
        final token = await SharedPrefsService.getToken();
        final email = await SharedPrefsService.getUserEmail();
        final name = await SharedPrefsService.getUserName();
        final id = await SharedPrefsService.getUserId();
        final role = await SharedPrefsService.getUserRole();
        
        if (token != null && email != null && id != null) {
          _user = UserModel(
            id: id,
            email: email,
            name: name ?? email.split('@')[0],
            roleName: role ?? 'user',
            token: token,
          );
          _isLoggedIn = true;
          notifyListeners();
        }
      }
    } catch (e) {
      print('Error checking login status: $e');
    }
  }
  
  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    
    try {
      final user = await _authRepo.login(email, password);
      
      print('Login Success - User ID: ${user.id}');
      print('Login Success - User Role: ${user.roleName}');
      print('Login Success - Token: ${user.token}');
      
      _user = user;
      
      // Save to shared preferences
      await SharedPrefsService.saveUserData(
        token: user.token,
        email: user.email,
        name: user.name,
        id: user.id,
        role: user.roleName,
      );
      
      _isLoggedIn = true;
      _isLoading = false;
      notifyListeners();
      
      return true;
    } catch (e) {
      _error = e.toString().replaceAll('Exception: ', '');
      print('Login ViewModel Error: $_error');
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }
  
  Future<bool> register(String email, String password, String name) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    
    try {
      final user = await _authRepo.register(email, password, name);
      
      _user = user;
      
      await SharedPrefsService.saveUserData(
        token: user.token,
        email: user.email,
        name: user.name,
        id: user.id,
        role: user.roleName,
      );
      
      _isLoggedIn = true;
      _isLoading = false;
      notifyListeners();
      
      return true;
    } catch (e) {
      _error = e.toString().replaceAll('Exception: ', '');
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }
  
  Future<void> logout() async {
    await SharedPrefsService.clearAll();
    _user = null;
    _isLoggedIn = false;
    _error = null;
    notifyListeners();
  }
  
  void clearError() {
    _error = null;
    notifyListeners();
  }
  
  Future<void> getUserProfile() async {
    if (_user?.token == null) return;
    
    _isLoading = true;
    notifyListeners();
    
    try {
      final user = await _authRepo.getProfile(_user!.token);
      _user = user;
      notifyListeners();
    } catch (e) {
      _error = 'Failed to load profile: ${e.toString().replaceAll('Exception: ', '')}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}