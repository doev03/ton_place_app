import 'package:dio/dio.dart';
import 'package:ton_place/core/constants.dart';
import 'package:ton_place/features/profile/models/profile_data.dart';
import 'dart:convert' as convert;

class ProfileRepository {
  final _dio = Dio();

  Future<ProfileData> getUserData (String id) async {
    try {
      final url = '$baseUrl/profile/$id';
      const headers = {
        'Authorization': authorization,
      };

      final response = await _dio.get(url, options: Options(headers: headers));
      return ProfileData.fromJson(convert.jsonDecode(response.data));
    } catch (e) {
      rethrow;
    }
  }
}