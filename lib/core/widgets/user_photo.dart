import 'package:flutter/material.dart';

class UserPhoto extends StatelessWidget {
  const UserPhoto({
    Key? key,
    required this.photoId,
    required this.photo,
    this.borderRadius,
    this.width = 52,
    this.height = 52,
    this.shape = BoxShape.rectangle,
  }) : super(key: key);

  final int photoId;
  final String photo;
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;
  final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    if (shape == BoxShape.circle) {
      return SizedBox(
        width: width,
        height: height,
        child: ClipOval(
          child: photoId == 0
              ? Image.asset('assets/ava_placeholder.png', fit: BoxFit.cover)
              : Image.network(
                  photo,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    return const SizedBox();
                  },
                ),
        ),
      );
    }
    if (borderRadius != null) {
      return SizedBox(
        width: width,
        height: height,
        child: ClipRRect(
          borderRadius: borderRadius,
          child: photoId == 0 ? Image.asset('assets/ava_placeholder.png', fit: BoxFit.cover) : Image.network(photo, fit: BoxFit.cover),
        ),
      );
    }
    return SizedBox(
      width: width,
      height: height,
      child: photoId == 0 ? Image.asset('assets/ava_placeholder.png', fit: BoxFit.cover) : Image.network(photo, fit: BoxFit.cover),
    );
  }
}
