class Photo {
  Photo({
    this.photoId,
    this.photoMedium,
    this.photoLarge,
    this.width,
    this.height,
    this.encrypted,
    this.photoMediumEncrypted,
    this.photoLargeEncrypted,
  });

  final int? photoId;
  final String? photoMedium;
  final String? photoLarge;
  final int? width;
  final int? height;
  final bool? encrypted;
  final String? photoMediumEncrypted;
  final String? photoLargeEncrypted;

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
    photoId: json['photoId'],
    photoMedium: json['photoMedium'],
    photoLarge: json['photoLarge'],
    width: json['width'],
    height: json['height'],
    encrypted: json['encrypted'],
    photoMediumEncrypted: json['photoMediumEncrypted'],
    photoLargeEncrypted: json['photoLargeEncrypted'],
  );

  Map<String, dynamic> toJson() => {
    'photoId': photoId,
    'photoMedium': photoMedium,
    'photoLarge': photoLarge,
    'width': width,
    'height': height,
    'encrypted': encrypted,
    'photoMediumEncrypted': photoMediumEncrypted,
    'photoLargeEncrypted': photoLargeEncrypted,
  };
}