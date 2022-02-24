import 'dart:convert' as convert;

import 'package:dio/dio.dart';
import 'package:ton_place/core/constants.dart';

import '../models/group_data.dart';

class GroupRepository {
  final _dio = Dio();

  Future<GroupData> getGroupData(String id) async {
    try {
      final url = '$baseUrl/group/$id';
      const headers = {
        'Authorization': authorization,
      };

      final response = await _dio.get(url, options: Options(headers: headers));
      return GroupData.fromJson(convert.jsonDecode(response.data));
    } catch (e) {
      rethrow;
    }
  }
}
