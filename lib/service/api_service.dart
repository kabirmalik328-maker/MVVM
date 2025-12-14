import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // ✅ آپ کا API base URL
  static const String baseUrl = "https://vendor.umazing.shop";
  
  // Generic POST method
  static Future<Map<String, dynamic>> post(
    String endpoint, 
    Map<String, dynamic> body,
    {String? token}
  ) async {
    try {
      // Headers تیار کریں
      Map<String, String> headers = {
        'accept': 'application/json',
        'Content-Type': 'application/json',
      };
      
      // اگر token ہے تو Authorization header شامل کریں
      if (token != null && token.isNotEmpty) {
        headers['Authorization'] = 'Bearer $token';
      }
      
      final response = await http.post(
        Uri.parse('$baseUrl/$endpoint'),
        headers: headers,
        body: jsonEncode(body),
      );

      print('📡 API Request: $baseUrl/$endpoint');
      print('📦 Request Body: ${jsonEncode(body)}');
      print('📥 API Response: ${response.statusCode} - ${response.body}');

      final responseData = jsonDecode(response.body);
      
      if (response.statusCode == 200 || response.statusCode == 201) {
        return responseData;
      } else {
        // API سے error message نکالیں
        String errorMessage = 'Unknown error occurred';
        
        if (responseData.containsKey('detail')) {
          errorMessage = responseData['detail'].toString();
        } else if (responseData.containsKey('message')) {
          errorMessage = responseData['message'].toString();
        } else if (responseData.containsKey('error')) {
          errorMessage = responseData['error'].toString();
        }
        
        throw Exception('API Error ($endpoint): $errorMessage');
      }
    } on http.ClientException catch (e) {
      throw Exception('Network Error: ${e.message}');
    } on FormatException catch (e) {
      throw Exception('Invalid response format: $e');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  // Specific login method for your API
  static Future<Map<String, dynamic>> loginUser(
    String email, 
    String password,
  ) async {
    return await post('users/login', {
      'email': email,
      'password': password,
    });
  }

  // Register method (اگر آپ کے پاس ہے)
  static Future<Map<String, dynamic>> registerUser(
    String email,
    String password,
    String name,
  ) async {
    return await post('users/register', {
      'email': email,
      'password': password,
      'name': name,
    });
  }

  // Get user profile (اگر آپ کے پاس ہے)
  static Future<Map<String, dynamic>> getUserProfile(String token) async {
    return await post('users/profile', {}, token: token);
  }
}