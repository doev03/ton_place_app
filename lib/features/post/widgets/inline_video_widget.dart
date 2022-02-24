import 'package:flutter/material.dart';
import 'package:ton_place/core/models/models.dart';

class InlineVideoWidget extends StatelessWidget {
  const InlineVideoWidget({Key? key, required this.video}) : super(key: key);

  final Video video;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: video.height!.toDouble() / video.width! * width,
      color: Colors.green,
    );
  }
}
