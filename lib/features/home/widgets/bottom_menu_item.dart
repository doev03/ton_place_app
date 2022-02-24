import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ton_place/core/colors.dart';

class BottomMenuItem extends StatelessWidget {
  const BottomMenuItem({
    Key? key,
    this.isActive = false,
    required this.icon,
    required this.label,
    required this.width,
    required this.onTap,
    this.hasSubscriptions = false,
    this.dialogsCount = 0,
  }) : super(key: key);

  final bool isActive;
  final String icon;
  final String label;
  final double width;
  final GestureTapCallback onTap;
  final bool hasSubscriptions;
  final int dialogsCount;

  @override
  Widget build(BuildContext context) {
    final color = isActive ? RootColors.tint : SchemeColors.foregroundTertiary;

    return SizedBox(
      width: width,
      height: 60,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 24,
                width: 24,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SvgPicture.asset(
                      icon,
                      color: color,
                    ),
                    if (hasSubscriptions)
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: RootColors.tintNegative,
                            border: Border.all(color: SchemeColors.backgroundPrimary, width: 2),
                          ),
                        ),
                      ),
                    if (dialogsCount > 0)
                      Positioned(
                        right: -6,
                        top: -6,
                        child: Container(
                          height: 20,
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          constraints: const BoxConstraints(minWidth: 20),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: RootColors.tintNegative,
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: Text(
                            dialogsCount.toString(),
                            style: TextStyle(color: RootColors.constantDark, fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              Text(label, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    );
  }
}
