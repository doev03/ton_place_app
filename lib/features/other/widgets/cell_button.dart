import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ton_place/core/colors.dart';

class CellButton extends StatelessWidget {
  const CellButton({
    Key? key,
    required this.title,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  final String title;
  final String icon;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: SchemeColors.backgroundPrimary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text(title, style: TextStyle(color: SchemeColors.foregroundPrimary, fontSize: 18, fontWeight: FontWeight.w700), overflow: TextOverflow.ellipsis),
              const Spacer(),
              const SizedBox(width: 16),
              SizedBox(
                width: 28,
                height: 28,
                child: SvgPicture.asset(icon, color: SchemeColors.foregroundTertiary),
              )
            ],
          ),
        ),
      ),
    );
  }
}
