import 'post.dart';
import 'group.dart';
import 'user.dart';

class Link {
  Link({
    this.type,
    this.object,
    this.extra,
  });

  final String? type;
  final Post? object;
  final dynamic extra;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    type: json['type'],
    object: json['object'] == null ? null : Post.fromJson(json['object']),
    extra: json['extra'] == null ? null : json['extra']['followed'] == null ? Group.fromJson(json['extra']) : User.fromJson(json['extra']),
  );

  Map<String, dynamic> toJson() => {
    'type': type,
    'object': object == null ? null : object!.toJson(),
    'extra': extra == null ? null : extra!.toJson(),
  };
}