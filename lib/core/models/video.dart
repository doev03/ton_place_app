class Video {
  Video({
    this.videoId,
    this.photoMedium,
    this.photoLarge,
    this.source,
    this.width,
    this.height,
    this.encrypted,
  });

  final int? videoId;
  final String? photoMedium;
  final String? photoLarge;
  final String? source;
  final int? width;
  final int? height;
  final bool? encrypted;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
    videoId: json['videoId'],
    photoMedium: json['photoMedium'],
    photoLarge: json['photoLarge'],
    source: json['source'],
    width: json['width'],
    height: json['height'],
    encrypted: json['encrypted'],
  );

  Map<String, dynamic> toJson() => {
    'videoId': videoId,
    'photoMedium': photoMedium,
    'photoLarge': photoLarge,
    'source': source,
    'width': width,
    'height': height,
    'encrypted': encrypted,
  };
}