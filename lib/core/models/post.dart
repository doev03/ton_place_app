import 'attachment.dart';

class Post {
  Post({
    this.id,
    this.text,
    this.ownerId,
    this.publisherId,
    this.createdAt,
    this.updatedAt,
    this.parentId,
    this.views,
    this.likes,
    this.isLiked,
    this.comments,
    this.shares,
    this.attachments,
    this.canDelete,
    this.replyTo,
    this.level,
    this.pinned,
  });

  final int? id;
  final String? text;
  final int? ownerId;
  final int? publisherId;
  final int? createdAt;
  final int? updatedAt;
  final int? parentId;
  final int? views;
  final int? likes;
  final bool? isLiked;
  final int? comments;
  final int? shares;
  final List<Attachment>? attachments;
  final bool? canDelete;
  final dynamic replyTo;
  final int? level;
  final bool? pinned;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json['id'],
    text: json['text'],
    ownerId: json['ownerId'],
    publisherId: json['publisherId'],
    createdAt: json['createdAt'],
    updatedAt: json['updatedAt'],
    parentId: json['parentId'],
    views: json['views'],
    likes: json['likes'],
    isLiked: json['isLiked'],
    comments: json['comments'],
    shares: json['shares'],
    attachments: json['attachments'] == null ? null : List<Attachment>.from(json['attachments'].map((x) => Attachment.fromJson(x))),
    canDelete: json['canDelete'],
    replyTo: json['replyTo'],
    level: json['level'],
    pinned: json['pinned'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'text': text,
    'ownerId': ownerId,
    'publisherId': publisherId,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
    'parentId': parentId,
    'views': views,
    'likes': likes,
    'isLiked': isLiked,
    'comments': comments,
    'shares': shares,
    'attachments': attachments == null ? null : List<dynamic>.from(attachments!.map((x) => x.toJson())),
    'canDelete': canDelete,
    'replyTo': replyTo,
    'level': level,
    'pinned': pinned,
  };
}