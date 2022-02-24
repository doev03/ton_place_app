import 'dart:convert' as convert;

import 'package:dio/dio.dart';
import 'package:ton_place/core/constants.dart';
import 'package:ton_place/features/feed/models/feed_data.dart';

class FeedRepository {
  final _dio = Dio();

  Future<FeedData> feed(String section, int startFrom, bool suggestions) async {
    try {
      const url = '$baseUrl/feed';
      const headers = {
        'Authorization': authorization,
      };
      final body = {
        'section': section,
        'startFrom': startFrom,
        'suggestions': suggestions,
      };

      final response = await _dio.post(url, data: body, options: Options(headers: headers));
      return FeedData.fromJson(convert.jsonDecode(response.data));
    } catch (e) {
      rethrow;
    }
  }
}
