import 'package:bookly/core/consts/constants.dart';
import 'package:bookly/core/helper/log_helper.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final String baseUrl = kBaseUrl;

  ApiService(this._dio);

  Future<Map<String, dynamic>?> get({
    required String endPoint,
  }) async {
    try {
      final response = await _dio.get('$baseUrl/$endPoint');
      logSuccess('Data fetched successfully: ${response.data}');
      return response.data;
    } catch (e) {
      logError('Error fetching data: $e');
      return null;
    }
  }
}
