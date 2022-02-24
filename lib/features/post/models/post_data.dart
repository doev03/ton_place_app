import 'package:ton_place/core/models/models.dart';
//import 'dart:isolate' as isolate;

class PostData {
  PostData({
    this.post,
    this.comments,
    this.commentsCount,
    this.users,
    this.groups,
    this.commentsNextFrom,
  });

  final Post? post;
  final List<Post>? comments;
  final int? commentsCount;
  final Map<String, User>? users;
  final Map<String, Group>? groups;
  final String? commentsNextFrom;

  factory PostData.fromJson(Map<String, dynamic> json) => PostData(
        post: json['post'] == null ? null : Post.fromJson(json['post']),
        comments: json['comments'] == null ? null : List<Post>.from(json['comments'].map((x) => Post.fromJson(x))),
        commentsCount: json['comments_count'],
        users: json['users'] == null ? null : json['users']!.map((k, v) => MapEntry(k, User.fromJson(v))),
        groups: json['groups'] == null ? null : json['groups']!.map((k, v) => MapEntry(k, Group.fromJson(v))),
        commentsNextFrom: json['commentsNextFrom'],
      );

  Map<String, dynamic> toJson() => {
        'post': post == null ? null : post!.toJson(),
        'comments': comments == null ? null : List<dynamic>.from(comments!.map((x) => x.toJson())),
        'comments_count': commentsCount,
        'users': users == null ? null : users!.map((k, v) => MapEntry(k, v.toJson())),
        'groups': groups == null ? null : groups!.map((k, v) => MapEntry(k, v.toJson())),
        'commentsNextFrom': commentsNextFrom,
      };
}
