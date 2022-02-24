import 'package:ton_place/core/models/models.dart';

class FeedData {
  FeedData({
    this.feed,
    this.users,
    this.groups,
    this.posts,
    this.nextFrom,
    this.notifications,
  });

  final List<Feed>? feed;
  final Map<String, User>? users;
  final Map<String, Group>? groups;
  final Map<String, Post>? posts;
  final String? nextFrom;
  final List<dynamic>? notifications;

  factory FeedData.fromJson(Map<String, dynamic> json) => FeedData(
    feed: json['feed'] == null ? null : List<Feed>.from(json['feed'].map((x) => Feed.fromJson(x))),
    users: json['users'] == null ? null : Map.from(json['users']).map((k, v) => MapEntry<String, User>(k, User.fromJson(v))),
    groups: json['groups'] == null ? null : Map.from(json['groups']).map((k, v) => MapEntry<String, Group>(k, Group.fromJson(v))),
    posts: json['posts'] == null ? null : Map.from(json['posts']).map((k, v) => MapEntry<String, Post>(k, Post.fromJson(v))),
    nextFrom: json['nextFrom'],
    notifications: json['notifications'] == null ? null : List<dynamic>.from(json['notifications'].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    'feed': feed == null ? null : List<dynamic>.from(feed!.map((x) => x.toJson())),
    'users': users == null ? null : Map.from(users!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    'groups': groups == null ? null : Map.from(groups!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    'posts': posts == null ? null : Map.from(posts!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    'nextFrom': nextFrom,
    'notifications': notifications == null ? null : List<dynamic>.from(notifications!.map((x) => x)),
  };
}

class Feed {
  Feed({
    this.id,
    this.type,
    this.object,
    this.isSuggestion,
  });

  final int? id;
  final FeedType? type;
  final int? object;
  final bool? isSuggestion;

  factory Feed.fromJson(Map<String, dynamic> json) => Feed(
    id: json['id'],
    type: json['type'] == null ? null : feedTypeValues.map[json['type']],
    object: json['object'],
    isSuggestion: json['isSuggestion'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type == null ? null : feedTypeValues.reverse[type],
    'object': object,
    'isSuggestion': isSuggestion,
  };
}

enum FeedType { post }

final feedTypeValues = EnumValues({
  'post': FeedType.post
});