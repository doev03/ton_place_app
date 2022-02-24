import 'package:dio/dio.dart';
import 'package:ton_place/core/constants.dart';
import 'package:ton_place/features/home/models/init_data.dart';
import 'dart:convert';

class HomeRepository {
  final _dio = Dio();

  Future<InitData> init() async {
    try {
      const url = '$baseUrl/main/init';
      const headers = {
        'Authorization': authorization,
      };

      final response = await _dio.get(url, options: Options(headers: headers));

      return InitData.fromJson(jsonDecode(response.data));
    } on DioError catch (e) {
      rethrow;
    }
  }
}
