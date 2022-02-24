class Group {
  Group({
    this.id,
    this.name,
    this.description,
    this.followers,
    this.photoId,
    this.photo,
    this.photoMedium,
    this.photoLarge,
    this.status,
    this.link,
    this.adultOnly,
  });

  final int? id;
  final String? name;
  final String? description;
  final int? followers;
  final int? photoId;
  final String? photo;
  final String? photoMedium;
  final String? photoLarge;
  final String? status;
  final String? link;
  final bool? adultOnly;

  factory Group.fromJson(Map<String, dynamic> json) => Group(
    id: json['id'],
    name: json['name'],
    description: json['description'],
    followers: json['followers'],
    photoId: json['photoId'],
    photo: json['photo'],
    photoMedium: json['photoMedium'],
    photoLarge: json['photoLarge'],
    status: json['status'],
    link: json['link'],
    adultOnly: json['adultOnly'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'followers': followers,
    'photoId': photoId,
    'photo': photo,
    'photoMedium': photoMedium,
    'photoLarge': photoLarge,
    'status': status,
    'link': link,
    'adultOnly': adultOnly,
  };
}