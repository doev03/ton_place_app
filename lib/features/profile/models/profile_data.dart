import 'package:ton_place/core/models/models.dart';

class ProfileData {
  ProfileData({
    this.users,
    this.groups,
    this.posts,
    this.postsNextFrom,
    this.postsCount,
    this.isFollowFromMe,
    this.isFollowToMe,
    this.scheduledCount,
  });

  final Map<String, User>? users;
  final Map<String, Group>? groups;
  final List<Post>? posts;
  final String? postsNextFrom;
  final int? postsCount;
  final bool? isFollowFromMe;
  final bool? isFollowToMe;
  final int? scheduledCount;

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
        users: json['users'] == null ? null : (json['users']! as Map).map((k, v) => MapEntry(k, User.fromJson(v))),
        groups: json['groups'] == null ? null : (json['groups']! as Map).map((k, v) => MapEntry(k, Group.fromJson(v))),
        posts: json['posts'] == null ? null : List<Post>.from(json['posts']!.map((x) => Post.fromJson(x))),
        postsNextFrom: json['postsNextFrom'],
        postsCount: json['posts_count'],
        isFollowFromMe: json['is_follow_from_me'],
        isFollowToMe: json['is_follow_to_me'],
        scheduledCount: json['scheduledCount'],
      );

  Map<String, dynamic> toJson() => {
        'users': users == null ? null : users!.map((k, v) => MapEntry(k, v.toJson())),
        'groups': groups == null ? null : groups!.map((k, v) => MapEntry(k, v.toJson())),
        'posts': posts == null ? null : List<dynamic>.from(posts!.map((x) => x.toJson())),
        'postsNextFrom': postsNextFrom,
        'posts_count': postsCount,
        'is_follow_from_me': isFollowFromMe,
        'is_follow_to_me': isFollowToMe,
        'scheduledCount': scheduledCount,
      };
}
