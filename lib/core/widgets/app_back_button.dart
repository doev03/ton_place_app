import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ton_place/core/colors.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.maybePop(context);
      },
      child: Container(
        width: 48,
        height: 48,
        alignment: Alignment.center,
        child: SizedBox(
          width: 28,
          height: 28,
          child: SvgPicture.asset(
            'assets/arrow_left.svg',
            color: RootColors.tint,
          ),
        ),
      ),
    );
  }
}
