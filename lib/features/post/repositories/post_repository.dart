import 'package:dio/dio.dart';
import 'package:ton_place/core/constants.dart';
import '../models/post_data.dart';
import 'dart:convert' as convert;

class PostRepository {
  final _dio = Dio(BaseOptions(headers: {'Authorization': authorization}));

  Future<PostData> getPost(int postId) async {
    try {
      final url = '$baseUrl/posts/$postId';

      final response = await _dio.post(url);

      return PostData.fromJson(convert.jsonDecode(response.data));
    } catch (e) {
      rethrow;
    }
  }
  Future<int> likePost(int postId) async {
    try {
      final url = '$baseUrl/likes/$postId/post/add';

      final response = await _dio.post(url);

      return convert.jsonDecode(response.data)['likes_count'] as int;
    } catch (e) {
      rethrow;
    }
  }
}
