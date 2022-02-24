import 'link.dart';
import 'photo.dart';
import 'video.dart';

class Attachment {
  Attachment({
    this.type,
    this.photo,
    this.link,
    this.video,
  });

  final AttachmentType? type;
  final Photo? photo;
  final Link? link;
  final Video? video;

  factory Attachment.fromJson(Map<String, dynamic> json) => Attachment(
    type: attachmentTypeValues.map[json['type']],
    photo: json['photo'] == null ? null : Photo.fromJson(json['photo']),
    link: json['link'] == null ? null : Link.fromJson(json['link']),
    video: json['video'] == null ? null : Video.fromJson(json['video']),
  );

  Map<String, dynamic> toJson() => {
    'type': attachmentTypeValues.reverse[type],
    'photo': photo == null ? null : photo!.toJson(),
    'link': link == null ? null : link!.toJson(),
    'video': video == null ? null : video!.toJson(),
  };
}

enum AttachmentType { video, photo, link }

final attachmentTypeValues = EnumValues({
  'link': AttachmentType.link,
  'photo': AttachmentType.photo,
  'video': AttachmentType.video
});

class EnumValues<T> {
  final Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
