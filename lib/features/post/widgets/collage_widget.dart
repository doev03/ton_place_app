import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:ton_place/core/models/attachment.dart';

///TO_DO Разрабатывается...
class CollageWidget extends StatelessWidget {
  const CollageWidget({
    Key? key,
    this.attachments,
    required this.width,
  }) : super(key: key);

  final List<Attachment>? attachments;
  final double width;

  @override
  Widget build(BuildContext context) {
    final List<dynamic> attachments = this.attachments!.map((e) {
      switch (e.type!) {
        case AttachmentType.video:
          return e.video!;
        case AttachmentType.photo:
          return e.photo!;
        case AttachmentType.link:
          return null;
      }
    }).toList();

    const padding = 4.0;

    final collageItems = <CollageItem>[];
    switch (attachments.length) {
      case 1:
        final collageWidth = width;
        final collageHeight = collageWidth * attachments[0].height!.toDouble() / attachments[0].width!;

        collageItems.add(CollageItem(
          width: collageWidth * 1.0,
          height: collageHeight * 1.0,
        ));
        return collageItems.first;
      case 2:
        double minPhotoHeight = math.min(attachments[0].height! as int, attachments[1].height! as int).toDouble();
        double sumWidth =
            (minPhotoHeight * attachments[0].width!.toDouble() / attachments[0].height! + minPhotoHeight * attachments[1].width!.toDouble() / attachments[1].height!).toDouble();

        final collageWidth = width;
        final collageHeight = (collageWidth - 4) * minPhotoHeight / sumWidth;

        collageItems.add(CollageItem(
          width: collageHeight * attachments[0].width! / attachments[0].height!.toDouble(),
          height: collageHeight,
          photo: 'https://311606.selcdn.ru/tonplace/photos/136/a1c296e7-52ce-4f7c-4f5a-4eb4fb73cf78jpg',
        ));
        collageItems.add(CollageItem(
          width: collageHeight * attachments[1].width! / attachments[1].height!.toDouble(),
          height: collageHeight,
          photo: 'https://311606.selcdn.ru/tonplace/photos/286/4cedb67d-ea97-4520-7ca7-d71e8903e571jpg',
        ));

        return Wrap(
          spacing: padding,
          runSpacing: padding,
          children: collageItems,
        );
      case 3:
        final collageWidth = width;

    }

    return const SizedBox();
  }
}

class CollageItem extends StatelessWidget {
  const CollageItem({
    Key? key,
    required this.width,
    required this.height,
    this.photo,
  }) : super(key: key);

  final double width;
  final double height;
  final String? photo;

  @override
  Widget build(BuildContext context) {
    if (photo != null) {
      return SizedBox(
        width: width,
        height: height,
        child: Image.network(photo!, fit: BoxFit.cover),
      );
    }
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(color: Color(0xff67a785)),
    );
  }
}
