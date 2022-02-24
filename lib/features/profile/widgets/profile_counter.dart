import 'package:flutter/material.dart';
import 'package:ton_place/core/colors.dart';

class ProfileCounter extends StatelessWidget {
  const ProfileCounter({
    Key? key,
    required this.count,
    required this.label,
    this.onTap,
  }) : super(key: key);

  final int count;
  final String label;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: SchemeColors.backgroundSecondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              count.toString(),
              style: TextStyle(
                color: SchemeColors.foregroundPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w800,
                height: 24.0 / 20.0,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                color: SchemeColors.foregroundPrimary,
                fontSize: 12,
                height: 14.0 / 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
