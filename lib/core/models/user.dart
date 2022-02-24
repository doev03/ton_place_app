class User {
  User({
    this.id,
    this.firstName,
    this.lastName,
    this.sex,
    this.bDate,
    this.countryId,
    this.countryName,
    this.cityId,
    this.cityName,
    this.photoId,
    this.photo,
    this.photoMedium,
    this.photoLarge,
    this.followers,
    this.followed,
    this.lastUpdate,
    this.status,
    this.invites,
    this.domain,
    this.rating,
  });

  final int? id;
  final String? firstName;
  final String? lastName;
  final int? sex;
  final String? bDate;
  final int? countryId;
  final String? countryName;
  final int? cityId;
  final String? cityName;
  final int? photoId;
  final String? photo;
  final String? photoMedium;
  final String? photoLarge;
  final int? followers;
  final int? followed;
  final int? lastUpdate;
  final String? status;
  final int? invites;
  final String? domain;
  final int? rating;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    firstName: json['firstName'],
    lastName: json['lastName'],
    sex: json['sex'],
    bDate: json['bDate'],
    countryId: json['countryId'],
    countryName: json['countryName'],
    cityId: json['cityId'],
    cityName: json['cityName'],
    photoId: json['photoId'],
    photo: json['photo'],
    photoMedium: json['photoMedium'],
    photoLarge: json['photoLarge'],
    followers: json['followers'],
    followed: json['followed'],
    lastUpdate: json['lastUpdate'],
    status: json['status'],
    invites: json['invites'],
    domain: json['domain'],
    rating: json['rating'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'firstName': firstName,
    'lastName': lastName,
    'sex': sex,
    'bDate': bDate,
    'countryId': countryId,
    'countryName': countryName,
    'cityId': cityId,
    'cityName': cityName,
    'photoId': photoId,
    'photo': photo,
    'photoMedium': photoMedium,
    'photoLarge': photoLarge,
    'followers': followers,
    'followed': followed,
    'lastUpdate': lastUpdate,
    'status': status,
    'invites': invites,
    'domain': domain,
    'rating': rating,
  };
}