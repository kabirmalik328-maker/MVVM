import 'package:counter_app/model/user_model.dart';
import 'package:counter_app/service/api_service.dart';

class AuthRepository {
  
  Future<UserModel> login(String email, String password) async {
    try {
      final response = await ApiService.loginUser(email, password);
      
      if (response.isEmpty) {
        throw Exception('Empty response from server');
      }
      
      print('Login Response: $response');
      
      // Directly create UserModel from response
      return UserModel.fromJson(response);
    } catch (e) {
      print('Login Error: $e');
      
      if (e.toString().contains('Network Error')) {
        throw Exception('No internet connection. Please check your network.');
      } else if (e.toString().contains('401') || e.toString().contains('Unauthorized')) {
        throw Exception('Invalid email or password');
      } else if (e.toString().contains('404')) {
        throw Exception('User not found');
      } else if (e.toString().contains('500')) {
        throw Exception('Server error. Please try again later.');
      } else if (e.toString().contains('API Error')) {
        // Extract actual error message
        final errorMsg = e.toString().replaceAll('Exception: API Error (users/login): ', '');
        throw Exception(errorMsg);
      }
      throw Exception('Login failed. Please try again.');
    }
  }
  
  Future<UserModel> register(
    String email, 
    String password, 
    String name,
  ) async {
    try {
      final response = await ApiService.registerUser(email, password, name);
      return UserModel.fromJson(response);
    } catch (e) {
      print('Register Error: $e');
      throw Exception('Registration failed: ${e.toString().replaceAll('Exception: ', '')}');
    }
  }

  Future<UserModel> getProfile(String token) async {
    try {
      final response = await ApiService.getUserProfile(token);
      return UserModel.fromJson(response);
    } catch (e) {
      print('Profile Error: $e');
      throw Exception('Failed to load profile');
    }
  }
}