import 'package:ton_place/core/models/models.dart';

class GroupData {
  GroupData({
    this.users,
    this.groups,
    this.posts,
    this.postsNextFrom,
    this.postsCount,
    this.isFollowed,
    this.canPost,
    this.scheduledCount,
    this.isBannedFromGroup,
  });

  final Map<String, User>? users;
  final Map<String, Group>? groups;
  final List<Post>? posts;
  final String? postsNextFrom;
  final int? postsCount;
  final bool? isFollowed;
  final bool? canPost;
  final int? scheduledCount;
  final bool? isBannedFromGroup;

  factory GroupData.fromJson(Map<String, dynamic> json) => GroupData(
        users: json['users'] == null ? null : json['users']!.map((k, v) => MapEntry(k, User.fromJson(v))),
        groups: json['groups'] == null ? null : json['groups']!.map((k, v) => MapEntry(k, Group.fromJson(v))),
        posts: json['posts'] == null ? null : List<Post>.from(json['posts'].map((x) => Post.fromJson(x))),
        postsNextFrom: json['postsNextFrom'],
        postsCount: json['posts_count'],
        isFollowed: json['isFollowed'],
        canPost: json['canPost'],
        scheduledCount: json['scheduledCount'],
        isBannedFromGroup: json['isBannedFromGroup'],
      );

  Map<String, dynamic> toJson() => {
        'users': users == null ? null : users!.map((k, v) => MapEntry(k, v.toJson())),
        'groups': groups == null ? null : groups!.map((k, v) => MapEntry(k, v.toJson())),
        'posts': posts == null ? null : List<dynamic>.from(posts!.map((x) => x.toJson())),
        'postsNextFrom': postsNextFrom,
        'posts_count': postsCount,
        'isFollowed': isFollowed,
        'canPost': canPost,
        'scheduledCount': scheduledCount,
        'isBannedFromGroup': isBannedFromGroup,
      };
}
