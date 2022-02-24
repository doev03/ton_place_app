import 'package:flutter/material.dart';
import 'package:ton_place/core/colors.dart';

class OnlineActiveWidget extends StatelessWidget {
  const OnlineActiveWidget({Key? key, required this.lastUpdate}) : super(key: key);
  final int lastUpdate;

  @override
  Widget build(BuildContext context) {
    //final int secDiff = Duration(seconds: DateTime.now().millisecondsSinceEpoch ~/ 1000 - lastUpdate).inSeconds;
    final int secDiff = 1;
    if (secDiff < 60) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 8),
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: RootColors.tintLike,
            ),
          ),
          const SizedBox(width: 8),
          Text('онлайн', style: TextStyle(color: SchemeColors.foregroundTertiary, fontSize: 16)),
        ],
      );
    }

    return const SizedBox();
  }
}
