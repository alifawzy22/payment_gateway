import 'package:dio/dio.dart';

class DioServices {
  final Dio dio;

  DioServices({required this.dio});

  Future<Response> postMethod({
    required String path,
    required String token,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    String? contentType,
    Map<String, String>? headers,
  }) {
    return dio.post(
      path,
      queryParameters: queryParameters,
      data: data,
      options: Options(
        contentType: contentType ?? Headers.formUrlEncodedContentType,
        headers: headers ??
            {
              'Authorization': 'Bearer $token',
            },
      ),
    );
  }
}
